require "cve_scraper/version"
require "cve_scraper/cve_harvester"
require "cve_scraper/exploit_db_harvester"
require "cve_scraper/api_throttler"

module CveScraper
  class Worker
    def self.scrape_all_data
      CVEHarvester.new.all_data
    end

    def self.scrape_this_month_data
      CVEHarvester.new.month_data(Time.now.year, Time.now.month)
    end

    def self.scrape_month_data(year, month)
      CVEHarvester.new.month_data(year, month)
    end

    def self.process_exploit_db
      ExploitDbHarvester.new.harvest
    end
  end
end
