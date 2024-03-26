class Tradeline < ApplicationRecord
  has_many :deposits

  # Expose the outstanding balance of the Tradeline based on the sum of all deposits made for that tradeline
  def outstanding_balance
    amount - deposits.sum(:amount)
  end
end
