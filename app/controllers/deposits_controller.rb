class DepositsController < ApplicationController
  def create
    tradeline = Tradeline.find(params[:tradeline_id])
    deposit = tradeline.deposits.build(deposit_params)

    if deposit.amount <= tradeline.outstanding_balance
      if deposit.save
        render json: deposit, status: :created
      else
        render json: deposit.errors, status: :unprocessable_entity
      end
    else
      render json: { 
        error: "Deposit amount exceeds outstanding balance. Current outstanding balance: $#{tradeline.outstanding_balance}", 
        status: :unprocessable_entity }
    end
  end

  def index
    tradeline = Tradeline.find(params[:tradeline_id])
    deposits = tradeline.deposits
    render json: deposits
  end

  def show
    tradeline = Tradeline.find(params[:tradeline_id])
    deposit = tradeline.deposits.find(params[:id])
    render json: deposit
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount, :date)
  end
end
