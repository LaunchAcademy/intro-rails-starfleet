class StarshipsController < ApplicationController
  def index
    # first get all the starships
    # pass to ERB template to display
    # binding.pry
    @starships = Starship.all
  end

  def show
    # binding.pry
    @starship = Starship.find(params[:id])
    @crew_member = CrewMember.new

    @my_class = "foobarx"
  end

  def new 
    @starship = Starship.new
  end

  def create 
    @starship = Starship.new(starship_params)

    if @starship.save 
      flash[:success] = "YAY"
      redirect_to starship
    else  
      flash.now[:error] = @starship.errors.full_messages.to_sentence
      render :"starships/new"
    end

  end

  def starship_params 
    params.require(:starship).permit(:name, :ship_class, :location)
  end
end