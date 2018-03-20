class RacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @races = policy_scope(Race.all)
    if params[:sport].present? && params[:format].present? && params[:address].present? && params[:range].present?
      @races = Race.where(sport: params[:sport]).where(format: params[:format]).near(params[:address],params[:range])

    elsif params[:sport].present? && params[:address].present? && params[:range].present?
      @races = Race.where(sport: params[:sport]).near(params[:address],params[:range])

    elsif params[:sport].present? && params[:address].present? && params[:format].present?
      @races = Race.where(sport: params[:sport]).where(format: params[:format]).near(params[:address],20)

    elsif params[:format].present? && params[:address].present? && params[:range].present?
      @races = Race.where(format: params[:format]).near(params[:address],params[:range])

    elsif params[:address].present? && params[:sport].present?
      @races = Race.where(sport: params[:sport]).near(params[:address],params[:range])

    elsif params[:address].present? && params[:format].present?
      @races = Race.where(format: params[:format]).near(params[:address],params[:range])

    elsif params[:address].present? && params[:range].present?
      @races = Race.near(params[:address],params[:range])

    elsif params[:address].present?
      @races = Race.near(params[:address],20)

    elsif params[:sport].present?
      @races = Race.where(sport: params[:sport])

    else
      @races = Race.all
    end

    @markers = @races.map do |race|
      next if race.latitude.nil?
      { lat: race.latitude, lng: race.longitude }
    end
    @markers = @markers.compact
  end

  def show
    @race = policy_scope(Race.find(params[:id]))
  end

end
