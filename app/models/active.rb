class Active < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    name: 'A',
    serial: 'B',
    barcode: 'C'
}
    belongs_to :destination
    belongs_to :ubication
    
    validates :destination_id, presence: true
    validates :ubication_id, presence: true

end
