class Dog < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments 

    validates :name, :breed, :age, :personality, :size, presence: true
    
    validates :size, inclusion: {in: %w[small medium, large], message: "%{value} is not a valid size, please choose small, medium or large! pow woah!"}

end
