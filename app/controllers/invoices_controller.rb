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


    if @invoices.nil?
      @invoices =0
      redirect_to new_client_path

   else
    @monthly_past_12_months_turnover = Invoice.group_by_month(:invoiced_at).sum(:amount).values.last(12).where(user:current_user)
    @turn_over = 0
    @invoices.each do |invoice|
      @turn_over += invoice.amount
      @charge_sociale_service = (@turn_over*0.22).round(2)
      @charge_sociale_vente = (@turn_over*0.12).round(2)

      @taxe_chambre_consulaire_vente = (@turn_over*0.0015).round(2)
      @taxe_chambre_consulaire_service = (@turn_over*0.0044).round(2)
      @income_tax_revente = ((@turn_over*0.7)*1.07).round(2)
      @income_tax_service = ((@turn_over*0.25)).round(2)
      @tva = (@turn_over*0.20).round(2)
    end
    end
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
