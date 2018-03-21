namespace :scraper do
  desc "scrape jogging plus"
  task jogging_plus: :environment do
    # categories = [....]
    #categories = ["marathons/france"]
    # categories.each do |category|
    # end

    JoggingPlusScraperService.new('marathons/france').scrape
  end
