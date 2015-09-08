class ReviewsController < ApplicationController

  def show
    @vinyl = Vinyl.find(params[:vinyl_id])
    @reviews = @vinyl.reviews
  end

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review = @vinyl.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to user_vinyl_path(current_user, @vinyl), notice: "Review saved"
    else
      redirect_to user_vinyl_path(current_user, @vinyl), notice: "Review failed to save. Try again"
    end
  end

  def update
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review was updated."
      redirect_to @vinyl
    else
      flash[:error] = "There was an error saving the review. Please try again."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review was deleted successfully."
      redirect_to @vinyl
    else
      flash[:error] = "There was an error deleting the review."
      render :show
    end
  end

  def edit
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review = Review.find(params[:id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
