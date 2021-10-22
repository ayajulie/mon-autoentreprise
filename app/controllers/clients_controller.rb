class ClientsController < ApplicationController

   def index
    @clients = Client.all
  end


   def show
    @client=Client.find(params[:id])
    @clients = Client.all
  end



  def new
   @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    if @client.save

      redirect_to new_invoice_path

    else
      render "new"
    end
  end


private

def client_params
  params.require(:client).permit(:user_id, :client)
end
end
