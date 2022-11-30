class Ubication < ApplicationRecord
    has_many :actives, dependent: :destroy
    validates :id, presence: true
end
