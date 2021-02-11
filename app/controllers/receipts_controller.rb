class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.new
    @tenants = Tenant.all
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipt_path(@receipt.id)
    else
      render :new
      raise
    end
  end

  private
    def receipt_params
      params.require(:receipt).permit(:period, :date, :tenant_id)
    end

end
