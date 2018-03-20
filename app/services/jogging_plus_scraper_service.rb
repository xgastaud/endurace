require 'open-uri'
require 'nokogiri'

class JoggingPlusScraperService
  def initialize(category)
    @category = category
    @base_url = "http://www.jogging-plus.com/calendrier/#{category}/"
  end

  def scrape
    puts "hello"
    # scrape
    html_file = open(@base_url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('tablo1').each do |element|
      puts "hello"
      #puts element.text.strip
      #puts element.attribute('href').value
    end
    # create instances
    # save
  end
end
