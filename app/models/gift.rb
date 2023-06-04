class Gift < ApplicationRecord
  has_many :gifters, dependent: :destroy

  scope :unbought, -> { where(bought: false) }

  def remaining_cost
    cost - gifters.sum(:contribution)
  end

  def progress_percentage
    (gifters.sum(:contribution) / cost.to_f) * 100
  end
end
