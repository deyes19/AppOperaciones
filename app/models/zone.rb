class Zone < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        id: 'A',
        description: 'B',
    }
    has_many :centers, dependent: :destroy
    validates :description, :id, presence: true
end
