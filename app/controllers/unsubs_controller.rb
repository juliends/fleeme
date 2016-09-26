class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    @user = current_user.id
  end

  def show
    @unsub = Unsub.find(current_user.id)
  end

  # non-CRUD actions
  def offers
    @user = current_user
  end

end
