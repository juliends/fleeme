class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new

    # initialize_hash
    # @fields = generate_fields(@hash_service)
  end
end
