class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new

    initialize_hash
    @fields = generate_fields(@hash_service)
    #loading the form_specs from json file
  end

  private

  def initialize_hash
    file = File.read('app/assets/form_specs/ugc.json')
    @hash_service = JSON.parse(file, symbolize_names: :true)[:fields]
  end

  def generate_fields(hash)
    hash.each do |field|
      @fieldname = field[:name]
    end
  end

  def unsub_params
    params.require(:unsub).permit(:form_complete, :photo)
  end
end
