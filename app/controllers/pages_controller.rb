class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy, :tos]

  def home
  end

  def privacy
  end

  def tos
  end
end
