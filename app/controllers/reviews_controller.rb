class ReviewsController < ApplicationController

    def create
      @review = Review.new(review_params)
      authorize @review
      # we need `restaurant_id` to asssociate review with corresponding restaurant
      @race = Race.find(params[:race_id])
      @review.race = @race
      @review.user = current_user
      @review.save
      redirect_to race_path(@race)
    end



    private

    def review_params
      params.require(:review).permit(:comment, :score)
    end
end
