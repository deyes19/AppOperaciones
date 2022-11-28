class Center < ApplicationRecord
    belongs_to :zone
    validates :name, :zone_id, presence: true
end
