class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    binding.pry
    @starship = Starship.find(params[:id])
  end
end