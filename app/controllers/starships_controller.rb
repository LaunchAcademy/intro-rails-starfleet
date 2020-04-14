class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
    @crew_members = @starship.crew_members
  end

  def new
    @starship = Starship.new
  end

  def create
    @starship = Starship.new(starship_params)
    if @starship.save
      flash[:notice] = "New starship created"
      redirect_to @starship
    else
      flash.now[:error] = @starship.errors.full_messages.to_sentence
      # flash.now[:error] = @starship.errors.full_messages.join(", ")
      render :new
    end
  end


  private

  def starship_params
    params.require(:starship).permit([:name, :ship_class, :location])
  end
end
