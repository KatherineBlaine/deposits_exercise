class Tradeline < ApplicationRecord
  has_many :deposits

  def outstanding_balance
    amount - deposits.sum(:amount)
  end
end
