require 'open-uri'
require 'nokogiri'

class JoggingPlusScraperService
  def initialize(category, limit)
    @category = category
    @base_url = "http://www.jogging-plus.com/calendrier/#{@category}/"
    @limit = limit
  end

  def scrape
    # @base = "http://www.jogging-plus.com/calendrier/calendrier-triathlon-france/"
    html_file = open(@base_url).read
    html_doc = Nokogiri::HTML(html_file)
    urls = []
    i = 1
    html_doc.search('.tablo1 a').each do |element|
    # puts element.search('.lienorange').text.strip
      if @limit == 0
        urls << element.attribute('href').value
      elsif i <= @limit
        urls << element.attribute('href').value
        i += 1
      end
    end

    urls.each do |url|
      # url = "http://www.jogging-plus.com/presentation-courses-trails/trail-atlantisport-environnement-loire-atlantique/"

      html_show = open(url).read
      html_doc_show = Nokogiri::HTML(html_show)
      bloc = []
      location = []
      address = ""

      link_registration = html_doc_show.search("#bloc-gauche2 .btn_inscr_event")
      url_registration = link_registration.attribute('href').value unless link_registration.empty?

      link_photo = html_doc_show.search("#myCarousel .item img")
      photo = link_photo.attribute('src').value unless link_photo.empty?

      link_inscription = html_doc_show.search("#bloc-gauche3 .lienorange")
      url_organizer =  link_inscription.attribute('href').value unless link_inscription.empty?

      html_doc_show.search("#bloc-gauche2 #bloc-info-label").each do |element|
        bloc << element
      end
      places_total = bloc[1].text

      name = html_doc_show.search(".td-post-title .entry-title").text.strip
      date = html_doc_show.search("#bloc-date-fiche").text.strip
      x = html_doc_show.search("#bloc-gauche2 #bloc-info-valeur").text.strip.split
      x.each_with_index do |element, index|
        if index < 3
          location << element
          address = location.join
        end
      end
      description = html_doc_show.search('em').first.text.strip
      race1 = Race.new(
        name: name,
        sport: categories[:sport],
        format: categories[:format],
        starts_at: date,
        address: address,
        description: description,
        url: url_organizer,
        registration_url: url_registration,
        available_slots: places_total,
        distance_swim: nil,
        distance_bike: nil,
        distance_run: nil,
        vertical_ascent_bike: nil,
        vertical_ascent_run: nil,
        image_race: photo,
      )
      race1.year = race1.starts_at.year unless race1.starts_at.nil?
      race1.save
      puts "#{race1.name} saved!"
    end
  end

  def categories
    if @category == "calendrier-triathlon-france"
      {sport:"Triathlon",
      format: "Triathlon"}
    elsif @category == "/marathons/france"
      {sport: "Running",
       format: "Marathon"}
    elsif @category == "semi-marathons/france"
      {sport: "Running",
       format: "Semi-marathon"}
    elsif @category == "courses-5-10-15-km/france"
      {sport: "Running",
       format: "15km et moins"}
    end
  end

end
