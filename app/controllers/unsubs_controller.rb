class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
  end

  def create
    @unsub = Unsub.new
    result = open('http://requestb.in/1gf6ago1?inspect')
    result.lines { |f| f.each_line {|line| p line} }

    api_url = 'https://api.typeform.com/v1/form/QyqJ49?key=TYPEFORM_KEY'

    open(api_url) do |stream|
      quote = JSON.parse(stream.read)
      puts quote['value']['joke']
    end

    raise

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
