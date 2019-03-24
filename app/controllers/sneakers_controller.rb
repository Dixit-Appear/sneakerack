class SneakersController < ApplicationController
  def index
    @sneakers = Sneaker.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    if @sneaker.save
       redirect_to sneakers_path
    else
      render :new
    end
  end

  def edit
    @sneaker = Sneaker.find(params[:id])
  end

  def update
    @sneaker = Sneaker.find(params[:id])
    @sneaker.update(sneaker_params)
    if @sneaker.save
      redirect_to sneaker_path
    else
      render :edit
    end
  end

  def destroy
    @sneaker = Sneaker.find(params[:id])
    @sneaker.destroy
    redirect_to sneakers_path
  end

  def sneaker_params
    params.require(:sneaker).permit(:name, :description, :brand, :price_per_sneaker, :size, :photo)
  end
end
