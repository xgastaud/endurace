class RacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @races = policy_scope(Race.all)
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
