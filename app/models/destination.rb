class Destination < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        id:'A',
        description: 'B',

    }
    belongs_to :center
    validates :description, :center_id, presence: true
    has_many :actives, dependent: :destroy
    has_many :ubications, dependent: :destroy
end
