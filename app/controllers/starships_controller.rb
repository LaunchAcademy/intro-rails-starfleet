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
  end
end