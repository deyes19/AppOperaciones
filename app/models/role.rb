class Role < ApplicationRecord
    before_save :uppercase_fields
    has_many :users, dependent: :restrict_with_exception
    
    private
    def uppercase_fields
        self.description.upcase!
    end

end
