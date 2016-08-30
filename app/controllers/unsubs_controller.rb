class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
  end

  def create
    @unsub = Unsub.new
    


    if @unsub.save
      redirect_to unsub_path(@unsub)
    else
      render 'service/show'
    end
  end

  def show
    @unsub = unsub.find(params[:id])
  end

  private

  def unsub_params
    params.require(:unsub).permit(:form_complete, :photo)
  end
end
