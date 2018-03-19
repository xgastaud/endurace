require 'open-uri'
require 'nokogiri'

# url = "https://www.calendrier.dusportif.fr/agenda-triathlon"
# url2 = "https://www.calendrier.dusportif.fr/agenda-triathlon-p2"
# url = "https://www.calendrier.dusportif.fr/agenda-triathlon-p{i}"

@races = []

  url = 'https://www.le-sportif.com/Calendar/CalendarSearch.aspx?SD=&ED=&AC=36&KW=&LAT=&LON=&DST=-1#searchresult'
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.media table').each do |element|
  # ContentPlaceHolder_Content_ListView_Calendar_Event_List_ctrl3_Panel_Date_Normal_3
  puts element.text.strip
end

  # url = 'https://www.calendrier.dusportif.fr/agenda-triathlon'
  # html_file = open(url).read
  # html_doc = Nokogiri::HTML(html_file)
  # html_doc.search('.vevent').each do |element|
  # puts element.text.strip
# end

