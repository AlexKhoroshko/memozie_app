class Card < ApplicationRecord
  belongs_to :deck
  mount_uploader :image, ImageUploader
  scope :active, -> { where(status: 'active') }


  validates :front, :back, :image, presence: :true
  enum status: { active: 0, inactive: 1 }

end
