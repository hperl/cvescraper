CVE Details Scraper
===========

## What is this gem?
  CVE details are important.  We would like to find them and search them.

## Installation

    gem "cve_scraper", "~> 0.0.3"

  Download and install by running:

    bundle install

## Usage

  - Define the maximum allowed calls to the website per seconds (contact www.cvedetails.com and ask them)

    ``` CVE_SCRAPER_MAXIMUM_CALLS_PER_SECOND = 2 ```

  - Define the output file location

    ``` CVE_SCRAPER_OUTPUT_FILE = 'path/to/location/file_name.txt' ```



 ### Now you can use:

    ``` CveScraper::Worker.scrape_all_data ```

  or

    ``` CveScraper::Worker.scrape_this_month_data ```


##TODO

  - Add Tests
  - Add more refined search methods

