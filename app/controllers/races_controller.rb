class RacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @races = policy_scope(Race.all)
  end

  def show
    @race = policy_scope(Race.find(params[:id]))
  end

end
