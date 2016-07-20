class ServicesController < ApplicationController

  before_action :set_service, only: [:show]

  def index
    @services = Service.all
  end

  def create
    @service = Service.create
  end

end
