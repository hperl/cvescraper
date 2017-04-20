require 'redis'
require 'hpricot'
require 'net/http'
require 'csv'

class ApiThrottler
  attr_accessor :redis, :threads

  GLOBAL = "counter_global"

  def initialize
    @redis = Redis.new
    @redis.set(GLOBAL, 0)
    @threads = []
  end

  def finalize
    @redis.flushdb
  end

  def local
    "counter_sec_#{Time.now.to_i}"
  end

  def try_fetch(foo)
    if @redis.get(GLOBAL).to_i <= CVE_SCRAPER_MAXIMUM_CALLS_PER_SECOND && @redis.incr(local).to_i <= CVE_SCRAPER_MAXIMUM_CALLS_PER_SECOND
      perform(foo)
    else
      sleep(1)
      try_fetch(foo)
    end
  end

  def perform(foo)
    @threads << Thread.new(foo) {
      @redis.incr(GLOBAL)
      foo.call
      @redis.decr(GLOBAL)
    }
    clean_up
  end

  private

  def clean_up
    @redis.flushdb
  end
end
