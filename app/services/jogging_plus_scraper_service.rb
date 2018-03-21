require 'open-uri'
require 'nokogiri'

class JoggingPlusScraperService
  def initialize(category)
    @category = category
    @base_url = "http://www.jogging-plus.com/calendrier/#{@category}/"
  end

  def scrape
    # puts "hello"
    # scrape
    html_file = open(@base_url).read
    html_doc = Nokogiri::HTML(html_file)
    urls = []
    html_doc.search('.tablo1 a').each do |element|
       # puts element.search('.lienorange').text.strip
       urls << element.attribute('href').value
    end
    urls.each do |url|
      html_show = open(url).read
      html_doc_show = Nokogiri::HTML(html_show)
      bloc =[]
      location =[]
      address = ""
      puts url_inscription = html_doc.search("#bloc-gauche3 .lienorange").attribute('href').value
      html_doc.search("#bloc-gauche2 #bloc-info-label").each do |element|
        bloc << element
      end
      puts places_total = bloc[1].text
      puts name = html_doc.search(".td-post-title .entry-title").text.strip
      puts date = html_doc.search("#bloc-date-fiche").text.strip
      x = html_doc.search("#bloc-gauche2 #bloc-info-valeur").text.strip.split
      x.each_with_index do |element, index|
        if index < 3
          location << element
          address = location.join
        end
      end
      puts address
      puts html_doc.search("#bloc-gauche2 br").text.strip
      html_doc.search("#bloc-gauche2 br").each do |element|
        puts element.text
      end
      puts description = html_doc.search('em').first.text.strip
      # puts html_doc.attribute("br").value
      race1 = Race.new(name: name, sport: "running", format: "marathon", starts_at: date, address: address, year: nil, description: description, url: nil, registration_url: url_inscription, available_slots: places_total, distance_swim: nil,
      distance_bike: nil,
      distance_run: nil,
      vertical_ascent_bike: nil,
      vertical_ascent_run: nil)
      race1.save
      puts "#{race1.name} saved!"
    end
    # create instances
    # save
  end
end
