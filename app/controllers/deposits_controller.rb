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
    # List all deposits for a given tradeline
    tradeline = Tradeline.find(params[:tradeline_id])
    deposits = tradeline.deposits
    render json: deposits
  end

  def show
    # View an individual deposit
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount, :date)
  end
end
