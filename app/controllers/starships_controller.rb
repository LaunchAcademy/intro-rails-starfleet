class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    # binding.pry
    @starship = Starship.find(params["id"])
  end

  def new
    # binding.pry
    @starship = Starship.new
  end

  def create
    # without strong params
    # name = params[:starship][:name]
    # ship_class = params[:starship][:ship_class]
    # location = params[:starship][:location]
    # @starship = Starship.new(name: name, ship_class: ship_class, location: location)

    # with strong params
    @starship = Starship.new(starship_params)

    if @starship.save
      flash[:notice] = "welcome to the fleet"
      redirect_to @starship
    else
      flash[:errors] = @starship.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def starship_params
    params.require(:starship).permit([:name, :ship_class, :location])
  end
end