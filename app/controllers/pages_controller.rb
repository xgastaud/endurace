class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy, :tos]

  def home
  end

  def privacy
  end

  def tos
  end

  def dashboard
    @wishlist = current_user.find_voted_items
  end
end
