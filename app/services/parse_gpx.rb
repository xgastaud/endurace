require 'nokogiri'

# <trkpt lat="48.8631428964436054229736328125" lon="2.32837133109569549560546875">
# <ele>67.8000030517578125</ele>
# <time>2018-03-18T14:03:23.000Z</time>

# file      = File.open('app/controllers/activity_2563702282.gpx')
# document  = Nokogiri::XML(file)
# document.root.css('trkpt').each do |plot|
#   # trk = plot.xpath('trk').text
#   ele = plot.css('ele').text
#   time = plot.css('time').text
#   p ele
#   p time
#   p plot.attributes['lat'].value
#   p plot.attributes['lon'].value
# end

 class ReadGpxFileService
  def initialize(file)
    @file = file
  end

  def parse_data
    file      = @file
    document  = Nokogiri::XML(file)
    document.root.css('trkpt').each do |plot|
      # trk = plot.xpath('trk').text
      ele = plot.css('ele').text
      time = plot.css('time').text
      p ele
      p time
      p plot.attributes['lat'].value
      p plot.attributes['lon'].value
    end
  end
 end
