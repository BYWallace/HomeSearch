class UploadedTransactionsController < ApplicationController
  before_action :find_agent
  
  def new
    @uploaded_transaction = @agent.uploaded_seller_transactions.new
  end

  def create
    @uploaded_transaction = @agent.uploaded_seller_transactions.create(uploaded_transaction_params)

    if @uploaded_transaction.save
      redirect_to agent_path(@agent), notice: "Transaction saved!"
    else
      render "new"
    end
  end

  private

  def find_agent
    @agent = Agent.find(params[:agent_id])
  end

  def uploaded_transaction_params
    params.require(:uploaded_transaction).permit(:address, :city, :state, :zip, :listing_agent, :listing_price, :listing_date, :selling_price, :selling_agent, :selling_date, :status, :property_type)
  end
end
