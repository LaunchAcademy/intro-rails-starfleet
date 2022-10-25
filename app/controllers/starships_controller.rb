class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
    @members = @starship.members
    @member = Member.new
  end

  def new
    @starship = Starship.new
  end

  def create
    @starship = Starship.new(starship_params)
    
    if @starship.save
      flash[:notice] = "You successfully created a Starship"
      redirect_to starships_path
    else
      binding.pry
      
      flash.now[:errors] = @starship.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def starship_params
    params.require(:starship).permit(:name, :ship_class, :location)
  end
end