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
    # name = params["starship"]["name"]
    # location = params["starship"]["location"]
    # ship_class = params["starship"]["ship_class"]

    # @starship = Starship.new(name: name, location: location, ship_class: ship_class)

    @starship = Starship.new(starship_params)

    if @starship.save
      flash[:notice] = "#{@starship.name} has been created!"

      redirect_to @starship
      # redirect_to starship_path(@starship)
      # redirect_to "/starships/#{@starship.id}"
    else
      # binding.pry
      flash.now[:errors] = @starship.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def starship_params
    params.require(:starship).permit([:location, :name, :ship_class])
  end
end