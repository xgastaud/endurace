class RacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @races = policy_scope(Race.all)


    if params[:sport].present? && params[:address].present? && params[:format].present?
      @races = Race.where(sport: params[:sport]).near(params[:address],params[:format])

    elsif params[:address].present? && params[:sport].present?
      @races = Race.where(sport: params[:sport]).near(params[:address],params[:format])

    elsif params[:address].present? && params[:format].present?
      @races = Race.near(params[:address],params[:format])

    elsif params[:address].present?
      @races = Race.near(params[:address],5)

    elsif params[:sport].present?
      @races = Race.where(sport: params[:sport])

    else
      @races = Race.all
    end

    @markers = @races.map do |race|
      { lat: race.latitude, lng: race.longitude }
    end
  end

  def show
    @race = policy_scope(Race.find(params[:id]))
  end

end
