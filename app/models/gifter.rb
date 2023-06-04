class Gifter < ApplicationRecord
  belongs_to :gift

  after_create do
    if !gift.splittable
      gift.update(bought: true)
    elsif gift.splittable && gift.remaining_cost == 0
      gift.update(bought: true)
    end
  end
end
