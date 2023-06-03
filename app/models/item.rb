class Item < ApplicationRecord
  scope :bought, -> { where(bought: true) }
  scope :unbought, -> { where(bought: false) }
end
