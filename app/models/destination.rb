class Destination < ApplicationRecord
    include PgSearch::Model
    before_save :uppercase_fields
    pg_search_scope :search_full_text, against: {
        id:'A',
        description: 'B',

    }
    belongs_to :center
    validates :description, :center_id, presence: true
    has_many :actives, dependent: :destroy
    has_many :ubications, dependent: :destroy
    private
    def uppercase_fields
        self.description.upcase!
    end
end
