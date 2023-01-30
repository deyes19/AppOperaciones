class Zone < ApplicationRecord
    include PgSearch::Model
    before_save :uppercase_fields
    pg_search_scope :search_full_text, against: {
        id: 'A',
        description: 'B',
    }
    has_many :centers, dependent: :destroy
    validates :description, :id, presence: true
    def uppercase_fields
        self.description.upcase!
    end
end
