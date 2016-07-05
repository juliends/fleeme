class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
  end

  def create
    api_url = 'https://api.typeform.com/v1/form/QyqJ49?key=TYPEFORM_KEY'

    open(api_url) do |stream|
      quote = JSON.parse(stream.read)
      puts quote['value']['joke']
    end
  end

  private

  def unsub_params
    params.require(:unsub).permit(:form_complete, :photo)
  end
end
