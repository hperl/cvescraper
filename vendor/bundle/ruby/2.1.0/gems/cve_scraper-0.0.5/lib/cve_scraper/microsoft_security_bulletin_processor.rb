require 'rubyXL'
require 'zip/zip'

class MicrosoftSecurityBulletinProcessor

  INPUT_FILE_LOCATION = "/Users/abdullahali/Desktop/cve_scraper/BulletinSearch_20131209_141719.xlsx"
  RUBY_XL_SEED_DATE = Date.parse('30-12-1899')

  def process
    data = RubyXL::Parser.parse(INPUT_FILE_LOCATION).first.extract_data

    data.each do |row|
      puts date_posted(row[0])
      row[1..row.size].each do |attribute|
        puts attribute
      end
    end
  end

  private

  # Really hacky!
  # This fixes an issue with rubyXL's date parse (which has been pull requested)
  # Would have used another gem like roo - but roo is many times slower
  #   for what we are trying to do here
  def date_posted(parsed_date)
    RUBY_XL_SEED_DATE + parsed_date.to_i
  end
end
