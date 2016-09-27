class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    @unsub = Unsub.create!(user_id: current_user.id)
    @id = @unsub.id
  end

  def show
    @unsub = Unsub.find(current_user.id)
  end

  # non-CRUD actions
  def offers
    @unsub = Unsub.find(current_user)
  end

end
