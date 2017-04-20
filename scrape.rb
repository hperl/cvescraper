require 'rubygems'
require 'bundler/setup'

require 'cve_scraper'

CVE_SCRAPER_MAXIMUM_CALLS_PER_SECOND = 2
CVE_SCRAPER_OUTPUT_FILE = 'all_data.csv'

#CveScraper::Worker.scrape_this_month_data
CveScraper::Worker.scrape_all_data
