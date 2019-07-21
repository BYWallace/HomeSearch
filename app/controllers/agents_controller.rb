class AgentsController < ApplicationController
  include Pagy::Backend

  def show
    @agent = Agent.find(params[:id])
    @pagy, @uploaded_transactions = pagy(@agent.all_transactions)
  end

  def random_agent
    redirect_to agent_path(Agent.all.sample)
  end
end
