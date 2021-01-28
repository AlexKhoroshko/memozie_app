class Card < ApplicationRecord
  belongs_to :deck

  enum status: { right: 0, wrong: 1 }
end
