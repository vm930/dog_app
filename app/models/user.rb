class User < ApplicationRecord
    has_many :appointments
    has_many :dogs, through: :appointments
    
 def full_name 
        user_full_name = "#{self.f_name} #{self.l_name}"
        user_full_name
    end 

end

