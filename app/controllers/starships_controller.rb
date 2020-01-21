class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params["id"])
  end

  def new
    @starship = Starship.new
  end

  def create
    # binding.pry
    # @starship = Starship.new({
    #   name: params["starship"]["name"],
    #   ship_class: params["starship"]["ship_class"],
    #   location: params["starship"]["location"]
    # })
    @starship = Starship.new(starship_params)

    if @starship.save
      redirect_to @starship
      # redirect_to starship_path(@starship)
      # redirect_to starship_path(@starship.id)
      # redirect_to '/starships/#{@starship.id}'
    else
      render :new
    end
  end

  private

  def starship_params
    params.require("starship").permit([:name, :ship_class, :location])
  end
end
