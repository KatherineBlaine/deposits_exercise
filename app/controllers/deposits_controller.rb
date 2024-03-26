class DepositsController < ApplicationController
  def create
    tradeline = Tradeline.find(params[:tradeline_id])
    deposit = tradeline.deposits.build(deposit_params)

    if deposit.save
      render json: deposit, status: :created
    else
      render json: deposit.errors, status: :unprocessable_entity
    end
  end

  def index
    render json: Deposit.all
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount, :date)
  end
end
