namespace :scraper do
  desc "scrape jogging plus"
  task jogging_plus: :environment do
    categories = ["/marathons/france", "calendrier-triathlon-france", "courses-5-10-15-km/france", "semi-marathons/france"]
    puts "what sport would you like to scrape?"
    categories.each_with_index do |index, category|
      puts "#{index} - #{category}"
    end
    print ">"
    index = STDIN.gets.chomp.to_i
    JoggingPlusScraperService.new(categories[index]).scrape
  end
end

# task jogging_plus: :environment do
#   categories = ["/marathons/france", "calendrier-triathlon-france", "courses-5-10-15-km/france", "semi-marathons/france"]
#   categories.each do |category|
#     JoggingPlusScraperService.new(category).scrape
#   end
# end
