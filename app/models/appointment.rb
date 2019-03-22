class Appointment < ApplicationRecord
    has_many :skills
    
    belongs_to :dog
    belongs_to :user
end
