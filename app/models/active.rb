class Active < ApplicationRecord
  include PgSearch::Model
  before_save :uppercase_fields
  pg_search_scope :search_full_text, against: {
    name: 'D',
    user_id: 'C',
    barcode: 'B',
    plate: 'A',
  }

    validates :plate, uniqueness: { scope: :rankactive_id, notice: "Ya existe para este padre." }
    validates :destination_id, presence: { message: "El destino es requerido." }
    validates :ubication_id, presence: { message: "La ubicación es requerida." }
    validates :user_id, presence: { message: 'Se necesita asignar un responsable. '}
    validates :barcode, presence: { message: 'se necesita que digites o pistolees la placa.- '}
    validates :rankactive_id, presence: { message: 'Se necesita especificar si es un padre o un hijo.  '}
  private

  def uppercase_fields
    self.name.upcase!
    # ... y así sucesivamente para cada campo del formulario que quieres convertir a mayúsculas
  end

end
