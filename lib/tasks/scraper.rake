namespace :scraper do
  desc "scrape jogging plus"
  task jogging_plus: :environment do
    categories = ["/marathons/france", "calendrier-triathlon-france", "courses-5-10-15-km/france", "semi-marathons/france"]
    categories.each do |category|
      JoggingPlusScraperService.new(category).scrape
    end
  end
end
