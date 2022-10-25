class MembersController < ApplicationController
  def create
    # binding.pry
    @member = Member.new(member_params)
    @starship = Starship.find(params[:starship_id])
    @member.starship = @starship

    if @member.save
      flash[:notice] = "You created a new Crew Member"
      redirect_to starship_path(@starship)
    else
      @members = @starship.members
      flash.now[:errors] = @member.errors.full_messages.to_sentence
      render :"starships/show"
    end
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end