class Center < ApplicationRecord
    belongs_to :zone
    validates :name, :zone_id, presence: true
    has_many :destination, dependent: :destroy
end
