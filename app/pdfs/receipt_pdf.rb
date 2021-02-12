class ReceiptPdf < Prawn::Document
  def initialize(receipt, current_user)
    super(top_margin: 90)
    @receipt = receipt
    @current_user = current_user
    user_info
    tenant_info
    receipt_info
  end

  def user_info
    bounding_box([3, 700], width: 250) do
      pad_top(10) { text "Bailleur :" }
      stroke_horizontal_rule
      pad(10) { text "#{@current_user.name} - #{@current_user.address}", size: 13, style: :bold }
      stroke_bounds
    end
  end

  def tenant_info
    move_down 20
    bounding_box([280, 600], width: 250) do
      pad_top(10) { text "Locataire :", left_margin: 10}
      stroke_horizontal_rule
      pad(10) { text "#{@receipt.tenant.name}, #{@receipt.tenant.address}", size: 13, style: :bold }
      stroke_bounds
    end
  end

  def receipt_info
    move_down 20
      bounding_box([3, 500], width: 528) do
      pad_top(10) { text "Quittance de loyer", align: :center, style: :bold, size: 20 }
      pad_bottom(10) { text "#{@receipt.period.strftime("%B %Y")}", align: :center }
      text "Reçu de: #{@receipt.tenant.name}"
      move_down 10
      text "Payé le : #{@receipt.date.strftime("%-d %B %Y")}"
      move_down 10
      text "La somme de : #{@receipt.tenant.rent + @receipt.tenant.charges}€"
      move_down 10
      text "Détails :"
      text " - Loyer nu: #{@receipt.tenant.rent}€,"
      text " - charges: #{@receipt.tenant.charges}€"
      move_down 10
      text "Pour loyer et accessoires des locaux sis : #{@receipt.tenant.address}"
      move_down 10
      pad_bottom(10) { text "En paiement du terme de : #{@receipt.period.strftime("%B %Y")}" }
      move_down 30
      text "Signature : #{@current_user.name}, Fait le : #{Date.today.strftime("%-d %B %Y")}"
      move_down 120
      pad_bottom(10) {  text "Le paiement de la présente n'emporte pas présomption de paiement des termes antérieurs. Cette quittance ou ce reçu annule tous les reçus qui auraient pu être donnés pour acompte versé sur le présent terme. En cas de congé précédemment donné, cette quittance ou ce reçu représenterait l'indémnité d'occupation et ne saurait être considéré comme un titre d'occupation. Sous réserve d'encaissement.", size: 10, color: "7a7a7a"}
      stroke_bounds
    end
  end


end
