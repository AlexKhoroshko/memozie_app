class Deck < ApplicationRecord
  has_many :cards
  belongs_to :user

  validates :title, :description, presence: :true
end
