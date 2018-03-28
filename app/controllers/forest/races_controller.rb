# ForestLiana::ApplicationController takes care of the authentication for you.
class Forest::RacesController < ForestLiana::ApplicationController
  def publish_all
    # Your business logic to send an email here.
    @races = Race.all
    @races.each do |race|
      race.published = true
      race.save
    end
    head :no_content
  end
  def unpublish_all
    # Your business logic to send an email here.
    @races = Race.all
    @races.each do |race|
      race.published = false
      race.save
    end
    head :no_content
  end
end
