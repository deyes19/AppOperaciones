class Active < ApplicationRecord
    belongs_to :destination
    belongs_to :ubication
    
    validates :destination_id, presence: true
    validates :ubication_id, presence: true
end
