class Starship < ActiveRecord::Base
    validates :name, presence: true 

    has_many :crew_members 

end