require 'csv'
require 'net/http'
require 'hpricot'
require 'tor_requests'

class CVEHarvester

  CVE_SCRAPER_EXPLOIT_DB_FILE_ARCHIVED = 'archive.tar.bz2'
  HOST = "www.cvedetails.com"
  BASE_PAGE_PATH = "/vulnerability-list.php?"

  def initialize
    @api_throttler = ApiThrottler.new
  end

  def all_data
    params = {:cvssscoremin => 0, :cvssscoremax => 10}
    search_url = generate_search_url(params)
    harvest_data(search_url)
    join_threads
  end

  def month_data(year, month)
    params = {:cvssscoremin => 0, :cvssscoremax => 10, :year => year, :month => month}
    search_url = generate_search_url(params)

    harvest_data(search_url)
    join_threads
  end

  def harvest_data(page_path)
    (1..number_of_pages(page_path)).each do |page_number|

      harvest_block = Proc.new {
        begin
          res = Tor::HTTP.get(HOST, page_path % page_number)
          source = res.body
        rescue
          puts "\nERROR requesting #{HOST}#{page_path % page_number}, retry"
          system("systemctl reload tor")
          retry
        end
        doc = Hpricot(source)

        table = doc.search("//*[@id='vulnslisttable']")

        table.search('/tr').each_with_index do |row, index|
          row_data = []
          if index.odd?
            row.search('/td').each do |column|
              row_data << column.search('text()').to_s.strip
            end
            File.open(CVE_SCRAPER_OUTPUT_FILE, 'a') { |f| f.write("#{row_data.to_csv}") }
          end
        end
      }
      @api_throttler.try_fetch(harvest_block)
    end
  end

  def number_of_pages(page_path)
    source = Net::HTTP.get(HOST, page_path % 1)
    doc = Hpricot(source)
    doc.search("//*[@id='pagingb']/a").last.to_plain_text.to_i
  end

  def generate_trc_sha_params(page_path)
    source = Net::HTTP.get(HOST, page_path % 1)
    doc = Hpricot(source)
    page_path_element = doc.search("//*[@id='pagingb']/a").first.to_s
    "&#{page_path_element.match(/(trc=(\d*)&sha=[^"]*)/).captures.first}"
  end

  def generate_search_url(params)
    params_string = ""
    params.each do |param_key, param_value|
      params_string += "#{param_key}=#{param_value}&"
    end

    search_url = "#{BASE_PAGE_PATH}#{params_string}page=%s"
    trc_sha = generate_trc_sha_params(search_url)
    search_url + trc_sha
  end

  private

  def join_threads
    @api_throttler.threads.each {|t| t.join}
  end
end
