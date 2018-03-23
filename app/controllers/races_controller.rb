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

    @races = @races.near(params[:address] || "Bourges", params[:range] || 500) if params[:address].present?
    # @races = @races.where("available_slots" )


    @markers = @races.map do |race|
      next if race.latitude.nil?
      { lat: race.latitude, lng: race.longitude}
      # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
    end
    @markers = @markers.compact
  end

  def show
    # @race = policy_scope(Race.find(params[:id]))
    @race = Race.find(params[:id])
    authorize @race
  end

  def like
    @race = Race.find(params[:race_id])
    authorize @race
    if current_user.voted_for?(@race)
      @race.unliked_by current_user
      p current_user.voted_for?(@race)
    else
      @race.liked_by(current_user)
    end
    redirect_to stored_location_for(:user)
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
