class Deposit < ApplicationRecord
  belongs_to :tradeline

  validate :amount_less_than_outstanding_balance

  private

  def amount_less_than_outstanding_balance
    if amount && amount > tradeline.outstanding_balance
      errors.add(:amount, "exceeds outstanding balance. Current outstanding balance: $#{tradeline.outstanding_balance}")
    end
  end
end
