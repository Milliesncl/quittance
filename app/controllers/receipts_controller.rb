class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
    @current_user = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReceiptPdf.new(@receipt, @current_user)
        send_data pdf.render, filename: "quittance_#{@receipt.id}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
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
