class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy, :tos]

  def home
  end

  def privacy
  end

  def tos
  end

  def dashboard
    @past_wishlist = current_user.find_voted_items.select {|item| item.starts_at < Date.today}
    @incoming_wishlist = current_user.find_voted_items.select {|item| item.starts_at > Date.today}
  end
end
