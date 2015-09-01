class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @reviews = @vinyl.reviews
    @review = @vinyl.reviews.build
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(params.require(:vinyl).permit(:title, :artist, :year, :label))
     if @vinyl.save
       flash[:notice] = "Album was saved."
       redirect_to @vinyl
     else
       flash[:error] = "There was an error saving the album. Please try again."
       render :new
     end
  end

  def edit
    @vinyl = Vinyl.find(params[:id])
  end

  def update
    @vinyl = Vinyl.find(params[:id])
     if @vinyl.update_attributes(params.require(:vinyl).permit(:title, :artist, :year, :label))
       flash[:notice] = "Album was updated."
       redirect_to @vinyl
     else
       flash[:error] = "There was an error saving the album. Please try again."
       render :edit
     end
  end
end
