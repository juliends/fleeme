class UnsubsController < ApplicationController

  before_action :set_user, only: [ :new, ]

  def new
    @service = Service.find(params[:service_id])
  end

  def show
  end

  private

  def set_user
    @session = session.id
    @user = User.find_by_session_id(@session)
    sign_in(:user, @user)
  end
end
