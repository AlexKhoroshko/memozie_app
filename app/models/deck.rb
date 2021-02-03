class Deck < ApplicationRecord
  has_many :cards
  belongs_to :user

  scope :publicly_available, -> { where(public: true) }
end
