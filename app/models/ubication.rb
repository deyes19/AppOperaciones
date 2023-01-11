class Ubication < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        description: 'B',
        id: 'A'
    }
    has_many :actives, dependent: :destroy
    validates :id, presence: true
    belongs_to :destination
end
