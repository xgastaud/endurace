class RacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :like]
  skip_after_action :verify_policy_scoped, only: :index

  def index

    if params[:pg_search_documents].present?
      PgSearch::Multisearch.rebuild(Race)
      @races = PgSearch.multisearch(params[:pg_search_documents]).map { |doc| doc.searchable }
    else

      @races = policy_scope(Race.all)
      filters = {}
      filters[:sport] = params[:sport] if params[:sport].present?
      filters[:format] = params[:format] if params[:format].present?
      @races = @races.where(filters)
      @races = @races.where("starts_at > ?", params[:from]) if params[:from].present?
      @races = @races.where("starts_at < ?", params[:to]) if params[:to].present?
     #@races = @races.near(params[:address] || "Bourges", params[:range] || 500) if params[:address].present?

      if params[:address].present? && params[:range].present?
        @races = @races.near(params[:address], params[:range])
      elsif params[:address].present?
        @races = @races.near(params[:address], 50)
      else
        @races = @races.near("Bourges", 1000)
      end
      @races = @races.where("available_slots > ?", params[:distance].split(",").first.to_i) if params[:distance].present?
      @races = @races.where("available_slots < ?", params[:distance].split(",").last.to_i) if params[:distance].present?
      # @races = @races.where(published: true) # only show races that have been published
      # @races = @races.where("starts_at >= ?", Date.today) # only show races in the future
      @races = @races.order(starts_at: :asc)
      # @races = params[:page] ? @races : @races.page(params[:page])
      @races = @races.page(params[:page] || 1)
    end


    @format = params[:format] if params[:format].present?
    @address = params[:address] if params[:address].present?
    @range = params[:range] if params[:range].present?
    @from = params[:from] if params[:from].present?
    @to = params[:to] if params[:to].present?
    # @minp = params[:distance].split(",").first.to_i if params[:distance].present?
    # @maxp = params[:distance].split(",").last.to_i if params[:distance].present?

    @markers = @races.map do |race|
      next if race.latitude.nil?
        {
          lat: race.latitude,
          lng: race.longitude,
          icon: helpers.asset_path("flag.png"),
          infoWindow: { content: render_to_string(partial: "/races/map_box", locals: { race: race }) }
        }
    end
    @markers = @markers.compact
  end

  def show
    # @race = policy_scope(Race.find(params[:id]))
    @review = Review.new
    @race = Race.find(params[:id])
    authorize @race
  end

  def like
    # si pas connecté
    if user_signed_in? == false
    # stocker en session l'id de la race à liker
      @race = Race.find(params[:race_id])
      authorize @race
      session[:liked_race_id] = @race.id
      # loguer redirect_to new_user_session_path
      redirect_to new_user_session_path
    # sinon
    else
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
  end
end
