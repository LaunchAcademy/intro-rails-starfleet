class CrewMembersController < ApplicationController

  def index
    @crew_members = CrewMember.all
  end

  def new 
    @starship = Starship.find(params[:starship_id])
    @crew_member = CrewMember.new
  end

  def create 
    @starship = Starship.find(params[:starship_id])
    @crew_member = CrewMember.new(crew_member_params)
    @crew_member.starship = @starship

    if @crew_member.save
      flash[:notice] = "yay"
      redirect_to @starship
    else
      flash.now[:error] = @crew_member.errors.full_messages.to_sentence
      render :new
    end
  end


  private

  def crew_member_params
    params.require(:crew_member).permit(:first_name, :last_name, :specialty_division)
  end
end
