class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :store_user_location!, if: :storable_location?
  before_action :unconnected_like!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end



  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  def storable_location?
    request.get?  && !devise_controller? && !request.xhr? #&& is_navigational_format?
  end

  def unconnected_like!
    # si session[:liked_race_id] alors on like
    if session[:liked_race_id]
      race = Race.find(session[:liked_race_id])
      race.liked_by(current_user)
    end
  end

  def store_user_location!
    # :user is the scope we are authenticating
    p request.fullpath

    store_location_for(:user, request.fullpath)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
