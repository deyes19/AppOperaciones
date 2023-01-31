class ActiveType < ApplicationRecord
    before_save :uppercase_fields
    validates :id, presence: true
    validates :description, presence: true
    
    private
    def uppercase_fields
    self.description.upcase!
    end
end
