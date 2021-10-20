class InvoicesController < ApplicationController




  def new
    @invoice = Invoice.new
  end

  def show
    @invoices = Invoice.all
  end


  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    if @invoice.save
        redirect_to invoices_calculate_path
    else
        render "new"
    end
  end

  def edit
     @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update!(invoice_params)
    redirect_to invoice
  end

  def calculate
    @invoices = Invoice.find_by(user:current_user)
=begin
    @turn_over = 0
    @invoices.each do |invoice|
      @turn_over += invoice.amount
      @charge_sociale_service = (@turn_over*0.22).round(2)
      @charge_sociale_vente = (@turn_over*0.12).round(2)

      @taxe_chambre_consulaire_vente = (@turn_over*0.0015).round(2)
      @taxe_chambre_consulaire_service = (@turn_over*0.0044).round(2)
      @income_tax_revente = ((@turn_over*0.7)*1.07).round(2)
      @income_tax_service = ((@turn_over*0.5)).round(2)
      @tva = (@turn_over*0.20).round(2)
    end
=end

    @turn_over = @invoices.sum(:amount)
    if @turn_over.nil?
      @turn_over=0
    else
    @charge_sociale_vente = (@turn_over*0.12).round
    @charge_sociale_service = (@turn_over*0.22).round

    @taxe_chambre_consulaire_vente = (@turn_over*0.0015).round
    @taxe_chambre_consulaire_service = (@turn_over*0.0044).round

    @income_tax_revente = ((@turn_over*0.7)*1.07).round
    @income_tax_service = ((@turn_over*0.5)).round

    @tva = (@turn_over * 1.00 *0.20).to_d
  end

# Tableaux CA mensuel les 12 derniers mois et les 12 mois précédents pour le graph en barres
    @monthly_past_12_months_turnover = Invoice.group_by_month(:invoiced_at).sum(:amount).values.last(12)
    @monthly_previous_past_12_months_turnover = Invoice.group_by_month(:invoiced_at).sum(:amount).values[-24..-13]



# Calcul CA 12 mois glissant
    @past_12_months_turnover = @monthly_past_12_months_turnover.sum
   # @previous_past_12_months_turnover = @monthly_previous_past_12_months_turnover.sum(:amount)

# Calcul pour le mois en cours
    @current_month_turnover = Invoice.group_by_month(:invoiced_at).sum(:amount).values.last

# Calcul pour l'année en cours
    @current_year_turnover = Invoice.group_by_year(:invoiced_at).sum(:amount).values.last
    if @current_year_turnover.nil?
       @current_year_turnover=0
   else
    @current_year_charge_sociale_vente = (@current_year_turnover * 0.12).round
    @current_year_taxe_chambre_consulaire_vente = (@current_year_turnover * 0.0015).round
    @current_year_income_tax_revente = ((@current_year_turnover * 0.7) * 1.07).round
    @current_year_income_tax_revente_to_pay = (@current_year_income_tax_revente * 0.12).round

    @current_year_charge_sociale_service = (@current_year_turnover * 0.22).round
    @current_year_taxe_chambre_consulaire_service = (@current_year_turnover * 0.0044).round
    @current_year_income_tax_service = ((@current_year_turnover * 0.5)).round
    @current_year_income_tax_service_to_pay = (@current_year_income_tax_service * 0.12).round

    @current_year_tva = (@current_year_turnover * 0.20).round

    @current_year_total_taxes_vente = (@current_year_charge_sociale_vente + @current_year_taxe_chambre_consulaire_vente + @current_year_income_tax_revente_to_pay)

    @current_year_total_taxes_service = (@current_year_charge_sociale_service + @current_year_taxe_chambre_consulaire_service + @current_year_income_tax_service_to_pay)
  end
# Calcul pour l'année n-1
    @past_year_turnover = Invoice.group_by_year(:invoiced_at).sum(:amount).values[-2]
    if @past_year_turnover.nil?
       @past_year_turnover=0
    else
    @past_year_charge_sociale_vente = (@past_year_turnover * 0.12).round
    @past_year_taxe_chambre_consulaire_vente = (@past_year_turnover * 0.0015).round
    @past_year_income_tax_revente = ((@past_year_turnover * 0.7) * 1.07).round
    @past_year_income_tax_revente_to_pay = (@past_year_turnover * 0.2).round

    @past_year_charge_sociale_service = (@past_year_turnover * 0.22).round
    @past_year_taxe_chambre_consulaire_service = (@past_year_turnover * 0.0044).round
    @past_year_income_tax_service = ((@past_year_turnover * 0.5)).round
    @past_year_income_tax_service_to_pay = (@past_year_turnover * 0.25).round

    @past_year_tva = (@past_year_turnover * 0.20).round

    @past_year_total_taxes_vente = (@past_year_charge_sociale_vente + @past_year_taxe_chambre_consulaire_vente + @past_year_income_tax_revente_to_pay)

    @past_year_total_taxes_service = (@current_year_charge_sociale_service + @past_year_taxe_chambre_consulaire_service + @past_year_income_tax_service_to_pay)
   end
# Calcul pour l'année n-2
    @previous_past_year_turnover = Invoice.group_by_year(:invoiced_at).sum(:amount).values[-3]
    if @previous_past_year_turnover.nil?
       @previous_past_year_turnover=0
    else
    @previous_past_year_income_tax_revente = ((@previous_past_year_turnover * 0.7) * 1.07).round
    @previous_past_year_income_tax_revente_to_pay = (@previous_past_year_turnover * 0.2).round
    @monthly_income_tax_revente_to_pay = @previous_past_year_income_tax_revente_to_pay / 12

    @previous_past_year_income_tax_service = ((@previous_past_year_turnover * 0.5)).round
    @previous_past_year_income_tax_service_to_pay = (@previous_past_year_turnover * 0.25).round
    @monthly_income_tax_service_to_pay = @previous_past_year_income_tax_service_to_pay / 12
  end

# Tableau avec CA exercice et taxe de l'exercice pour le graph doughnut
    if @current_year_total_taxes_vente.nil?
      @current_year_data_vente=0
       @current_year_data_service =0
    else
    @current_year_data_vente = [(@current_year_turnover - @current_year_total_taxes_vente), @current_year_total_taxes_vente, (72000 - @current_year_turnover - @current_year_total_taxes_vente) ]
    @current_year_data_service = [(@current_year_turnover - @current_year_total_taxes_service), @current_year_total_taxes_service, (72000 - @current_year_turnover - @current_year_total_taxes_service) ]
   end

# Calcul pour le mois m-1 CA (déclarations URSAFF)
 @past_month_turnover = @monthly_past_12_months_turnover[-2]
    if  @past_month_turnover.nil?
      @past_month_turnover=0
      @past_month_charge_sociale_vente=0
      @past_month_charge_sociale_service=0
    else
      @past_month_charge_sociale_vente = (@past_month_turnover * 0.12).round
      @past_month_charge_sociale_service = (@past_month_turnover * 0.22).round
    end

# Calcul augmentation par rapport à l'année précédente


  end


  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to root
  end

  private
  require 'date'

  def invoice_params
      params.require(:invoice).permit(:object, :amount, :invoiced_at, :user_id,)
  end



end
