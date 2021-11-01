class StarshipsController < ApplicationController
  def index
    # binding.pry
    @starships = Starship.all
  end

  def show
    @starship = Starship.find_by_id(params[:id])
  end
end
