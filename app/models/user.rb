class User < ApplicationRecord
    has_many :appointments
    has_many :dogs, through: :appointments

    validates :f_name, :l_name, :age, :occupation,:address, :bio, presence: true
    
 def full_name 
        user_full_name = "#{self.f_name} #{self.l_name}"
        user_full_name
    end 

end

