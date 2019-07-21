class BulkImportsController < ApplicationController
	def create
    agent = Agent.find(params[:agent_id])
    UploadedTransaction.csv_import(params[:file], agent.id)
    redirect_to agent_path(agent), notice: "Records imported!"
  end

  private

  def uploaded_transaction_params
    params.require(:bulk_import).permit(:file, :agent_id)
  end
end
