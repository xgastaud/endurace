require 'open-uri'
require 'nokogiri'

class LeSportifScraperService
  def initialize(limit)
    @base_url = 'https://www.le-sportif.com/Calendar/CalendarSearch.aspx?SD=&ED=&AC=60&KW=&LAT=&LON=&DST=-1#searchresult'
    @limit = limit
  end

  def scrape
    html_file = open(@base_url).read
    html_doc = Nokogiri::HTML(html_file)
    urls = []
    i = 1
    html_doc.search('.span8 .media-body a').each do |element|
      if @limit == 0
        urls << element.attribute('href').value
      elsif i <= @limit
        urls << element.attribute('href').value
        i += 1
      end
    end
    p urls
    puts i

    # urls.each do |url|
    #   html_show = open(url).read
    #   html_doc_show = Nokogiri::HTML(html_show)
    #   bloc = []
    #   location = []
    #   description_array = []
    #   description = ""
    #   address_array = []
    #   address = ""

    #   name = html_doc_show.search("#ContentPlaceHolder_Content_Label_Event_Name_Title").text.strip
    #   @sport_site = html_doc_show.search(".ContentPlaceHolder_Content_Label_HTML_Event_Description b").text.strip
    #   p @sport_site
    #   raise
    #   date = html_doc_show.search("#ContentPlaceHolder_Content_Label_HTML_Event_Description b").text.strip
    #   address = html_doc_show.search("#ContentPlaceHolder_Content_Label_Event_Place_Title b").text.strip

    #   description_html = html_doc_show.search('#ContentPlaceHolder_Content_Label_HTML_Event_Description p').text.split
    #   description_html.each do |element|
    #     description_array << element
    #     description = description_array.join(" ")
    #   end

    #   race1 = Race.new(
    #     name: name,
    #     sport: categories[:sport],
    #     format: categories[:format],
    #     starts_at: date,
    #     address: address,
    #     description: description,
    #     url: url_organizer,
    #     registration_url: url_registration,
    #     available_slots: places_total,
    #     distance_swim: nil,
    #     distance_bike: nil,
    #     distance_run: nil,
    #     vertical_ascent_bike: nil,
    #     vertical_ascent_run: nil,
    #     image_race: photo,
    #   )
    #   race1.year = race1.starts_at.year unless race1.starts_at.nil?
    #   race1.save
    #   puts "#{race1.name} saved!"
    # end
  end

  # def categories
  #   if @sport_site == "Triathlon"
  #     {sport:"Triathlon",
  #     format: "Autre"}
  #   elsif @sport_site == "Cyclosportive"
  #     {sport:"Cyclisme",
  #     format: "Autre"}
  #   elsif @sport_site == "Course à pied (sur route)"
  #     {sport:"Running",
  #     format: "Autre"}
  #   end
  # end

end
