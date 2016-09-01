class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    @email = Devise.friendly_token.first(8)
    @user = User.create!(email: @email)
  end

  def show

    # Permet de récupérer le User mais risque de latence si Typeform ne répond pas rapidement
    # @session = session.id
    # current_user = User.where(session_id: @session)
  end
end
