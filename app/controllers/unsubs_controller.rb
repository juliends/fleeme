class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
  end

  def show
    
  end
end
