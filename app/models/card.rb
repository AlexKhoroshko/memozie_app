class Card < ApplicationRecord
  belongs_to :deck
  mount_uploader :image, ImageUploader

  enum status: { right: 0, wrong: 1 }
end
