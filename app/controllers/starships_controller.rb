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
    @starship = Starship.new({
      name: params["starship"]["name"],
      ship_class: params["starship"]["ship_class"],
      location: params["starship"]["location"]
    })

    if @starship.save
      # redirect_to '/starships/#{@starship.id}'
      # redirect_to starship_path(@starship.id)
      # redirect_to starship_path(@starship)
      redirect_to @starship
    else
      render :new
    end
  end

  private

  # def starship_params
  #
  # end
end
