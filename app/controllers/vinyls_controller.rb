class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @review = Review.new
    @reviews = @vinyl.reviews
  end

  def new
    @user = User.find(params[:user_id])
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(params.require(:vinyl).permit(:title, :artist, :year, :label))
    @vinyl.user = current_user
    if @vinyl.save
      flash[:notice] = "Album was saved."
      redirect_to current_user
     else
       flash[:error] = "There was an error saving the album. Please try again."
       render :new
     end
  end

  def edit
    @vinyl = Vinyl.find(params[:id])
    @vinyl.save!
  end

  def update
    @vinyl = Vinyl.find(params[:id])
     if @vinyl.update_attributes(params.require(:vinyl).permit(:title, :artist, :year, :label))
       flash[:notice] = "Album was updated."
       redirect_to current_user
     else
       flash[:error] = "There was an error saving the album. Please try again."
       render :edit
     end
  end
end
