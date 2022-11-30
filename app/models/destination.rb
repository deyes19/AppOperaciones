class Destination < ApplicationRecord
    belongs_to :center
    validates :description, :center_id, presence: true
    has_many :actives, dependent: :destroy
end
