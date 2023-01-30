class Active < ApplicationRecord
  include PgSearch::Model
  before_save :uppercase_fields
  pg_search_scope :search_full_text, against: {
    name: 'D',
    user_id: 'C',
    barcode: 'B',
    plate: 'A',
  }
    belongs_to :destination
    belongs_to :ubication
    validates :plate, uniqueness: { scope: :rankactive_id, notice: "Ya existe para este padre." }
    validates :destination_id, presence: true
    validates :ubication_id, presence: true
  private

  def uppercase_fields
    self.name.upcase!
    # ... y así sucesivamente para cada campo del formulario que quieres convertir a mayúsculas
  end

end
