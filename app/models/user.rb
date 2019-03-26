class User < ApplicationRecord
  has_secure_password

    has_many :appointments
    has_many :dogs, through: :appointments

    validates :full_name, :age, :occupation, :location, presence: true


end
