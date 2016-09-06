class ServicesController < ApplicationController

  before_action :set_service, only: [:show]

  def index
    @services = Service.all
  end

  def show
    @session = session.id
    @email = Devise.friendly_token.first(8)
    @user = User.create!(email: @email, session_id: @session)
    sign_in @user
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end
end
