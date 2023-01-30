class Center < ApplicationRecord
    include PgSearch::Model
    before_save :uppercase_fields
    pg_search_scope :search_full_text, against: {
        id: 'A',
        name: 'B'

    }
    belongs_to :zone
    validates :name, :zone_id, presence: true
    has_many :destination, dependent: :destroy
    
    private
    def uppercase_fields
        self.name.upcase!
    end
    
end
