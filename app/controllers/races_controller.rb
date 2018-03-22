class RacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @races = policy_scope(Race.all)

    filters = {}
    filters[:sport] = params[:sport] if params[:sport].present?
    filters[:format] = params[:format] if params[:format].present?
    @races = @races.where(filters)

    @races = @races.where("starts_at > ?", params[:from]) if params[:from].present?
    @races = @races.where("starts_at < ?", params[:to]) if params[:to].present?

    @races = @races.near(params[:address], params[:range] || 20) if params[:address].present?



    @markers = @races.map do |race|
      next if race.latitude.nil?
      { lat: race.latitude, lng: race.longitude }
    end
    @markers = @markers.compact
  end

  def show
    @race = policy_scope(Race.find(params[:id]))
  end

  # def create
  #   @race = Race.new(product_params)
  #   @race.user = current_user
  #   if @race.save
  #     redirect_to product_path(@race)
  #   else
  #     render :new
  #   end
  # end

  # private

  #   def product_params
  #     params.require(:race).permit(:title, :category, :price_per_day, :address, :description, :photo)
  #   end
end
