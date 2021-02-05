class Card < ApplicationRecord
  belongs_to :deck
  mount_uploader :image, ImageUploader

  validates :front, :back, presence: :true
  enum status: { right: 0, wrong: 1 }
end
