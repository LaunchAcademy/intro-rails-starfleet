class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
  end

  def new
    @starship = Starship.new
  end

  def create
    @starship = Starship.new(new_starship_params)

    if !@starship.save
      redirect_to @starship
    else
      render :new
    end
  end

  private

  def new_starship_params
    params.require("starship").permit(:name, :ship_class, :location)
  end
end
