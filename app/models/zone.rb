class Zone < ApplicationRecord
    has_many :centers, dependent: :destroy
    validates :description, :id, presence: true
end
