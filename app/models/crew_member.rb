class CrewMember < ApplicationRecord 
    validates :first_name, presence: true 
    validates :last_name, presence: true 

    belongs_to :starship

end