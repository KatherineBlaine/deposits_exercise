class TradelinesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    tradelines = Tradeline.all
    render json: tradelines.as_json(methods: :outstanding_balance)
  end

  def show
    tradeline = Tradeline.find(params[:id])
    render json: tradeline.as_json(methods: :outstanding_balance)
  end

  private

  def not_found
    render json: 'not_found', status: :not_found
  end
end