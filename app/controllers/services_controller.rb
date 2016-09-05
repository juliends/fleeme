class ServicesController < ApplicationController

  before_action :set_service, only: [:show]

  def index
    @services = Service.all
  end

  def show
    @session = session.id
    # @email = Faker::Internet.email
    # @user = User.create!(email: @email)
    # warden.authenticate!(:scope => :user)
    # sign_in(user: @user)
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end
end
