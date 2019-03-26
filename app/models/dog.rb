class Dog < ApplicationRecord
  has_secure_password

    has_many :appointments
    has_many :users, through: :appointments

    validates :name, :breed, :age, :personality, :size, presence: true

end
