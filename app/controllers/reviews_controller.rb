class ReviewsController < ApplicationController
  def create
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review = @vinyl.reviews.new(review_params)
    @review.user_id = current_user.user_id
    if @review.save
      redirect_to @vinyl, notice: "Review saved"
    else
      redirect_to @vinyl, notice: "Review failed to save. Try again"
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
