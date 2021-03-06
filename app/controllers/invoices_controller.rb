class InvoicesController < ApplicationController

  before_action :set_client, only: [:edit, :upadate, :destroy]

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def show
    @invoice=Invoice.find(params[:id])
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
        redirect_to invoice_path
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

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to root
  end

  private

  def invoice_params
        params.require(:invoice).permit(:name, :amount, :object, :date, :client_id)
  end

  def set_client
      @client = Client.find(params[:id])
  end

end
