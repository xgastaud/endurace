namespace :scraper do
  desc "scrape le sportif"
  task le_sportif: :environment do
    puts "max number? (enter '0' for all)"
    print ">"
    limit = STDIN.gets.chomp.to_i
    LeSportifScraperService.new(limit).scrape
  end
end

