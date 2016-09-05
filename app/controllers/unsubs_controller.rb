class UnsubsController < ApplicationController

  after_action :set_user, only: [ :new, ]

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
  end

  def show
  end

  private

  def set_user
    @user = User.where(session_id: @session).first
    sign_in(:user, @user)
  end
end
