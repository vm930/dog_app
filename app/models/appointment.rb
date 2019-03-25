class Appointment < ApplicationRecord
    has_many :skills
    belongs_to :dog
    belongs_to :user, optional: true

    validates :title,:category,:location,:price, presence: true
end
