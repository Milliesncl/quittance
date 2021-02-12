class ReceiptPdf < Prawn::Document
  def initialize(receipt, current_user)
    super(top_margin: 70)
    @receipt = receipt
    @current_user = current_user
    user_info
    receipt_info
  end

  def user_info
    text "Bailleur: #{@current_user.name}, #{@current_user.address}."
  end

  def receipt_info
    text "Quittance de loyer"
    text "#{@receipt.period.strftime("%B %Y")}"
  end

  def tenant_info
    text ""
  end
end
