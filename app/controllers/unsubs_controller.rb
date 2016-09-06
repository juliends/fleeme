class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    @user = current_user.id
  end

  def show
  end

end
