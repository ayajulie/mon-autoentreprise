class InvoicesController < ApplicationController

def index
  @invoices = Invoice.all
end

def new
  @invoice = Invoice.new
end

def create
  @invoice = Invoice.new(params[:invoice])
end

private


end
