class ActiveType < ApplicationRecord
    before_save :uppercase_fields
   
    
    private
    def uppercase_fields
    self.description.upcase!
    end
end
