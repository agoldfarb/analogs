class ReviewsController < ApplicationController
  def create
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review = @vinyl.reviews.create(review_params)
    @review.user_id = current_user.user_id
    if @review.save
      redirect_to @vinyl, notice: "Review saved"
    else
      redirect_to @vinyl, notice: "Review failed to save. Try again"
    end
  end

  def edit
    @user = current_user
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review = Review.find(params[:id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
