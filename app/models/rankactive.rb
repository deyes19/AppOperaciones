class Rankactive < ApplicationRecord
    before_save :uppercase_fields
    has_many :actives

    private
    def uppercase_fields
        self.name.upcase!
    end
end
