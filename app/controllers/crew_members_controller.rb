class CrewMembersController < ApplicationController

    def new 
      @crew_member = CrewMember.new
      @starship = Starship.find(params[:starship_id])
    end

    def create 
      @crew_member = CrewMember.new(crew_member_params)
      @starship = Starship.find(params[:starship_id])
      @crew_member.starship = @starship

      if @crew_member.save 
        flash[:notice] = "May the force be with you"
        redirect_to @starship
      else 
        flash.now[:notice] = @crew_member.errors.full_messages.to_sentence
        render :new
      end

    end

    private

    def crew_member_params
      params.require(:crew_member).permit(:first_name, :last_name, :specialty_division)
    end

end
