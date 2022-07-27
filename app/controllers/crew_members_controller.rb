class CrewMembersController < ApplicationController 

    def create 
        @starship = Starship.find(params[:starship_id])
        @crew_member = CrewMember.new(crew_member_params)
        @crew_member.starship = @starship 

        if @crew_member.save
            flash[:success] = "All Hail the Fruits"
            redirect_to @starship
        else  
            flash.now[:error] = @crew_member.errors.full_messages.to_sentence
            render :"starships/show"
        end
    end

    private 

    def crew_member_params 
        params.require(:crew_member).permit(:first_name, :last_name, :specialty_division)
    end

end