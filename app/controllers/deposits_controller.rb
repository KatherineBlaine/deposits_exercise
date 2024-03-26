class DepositsController < ApplicationController
  def create
    tradeline = Tradeline.find(params[:tradeline_id])
    deposit = tradeline.deposits.build(deposit_params)

    if deposit.save
      render json: deposit, status: :created
    else
      render json: {
        error: deposit.errors.full_messages
      }, status: :unprocessable_entity
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