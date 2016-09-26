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
    # last line must be change cause Typeform might not send the information on time.
    # huge issue that must be taking care of.
    @unsub = Unsub.last
  end

end
