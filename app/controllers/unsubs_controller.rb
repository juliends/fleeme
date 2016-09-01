class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    @user = User.create
  end

  def show
    @session = session.id
    current_user = User.where(session_id: @session)
    raise
  end
end
