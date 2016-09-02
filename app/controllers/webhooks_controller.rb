class WebhooksController < ApplicationController
  # Ici il faut annuller la vérification des tokens qui protège toute app rails d' attaques csrf
  # Les deux lignes suivantes ont le même effet
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token

  # Typeform attend une réponse de notre controlleur pour valider la route
  # set_data permet de valider que le json contient des informations
  before_action :set_data, only: [ :ugc, :user ]

  def user
    @answers= @data["form_response"]["answers"]
    @infos = get_user_infos(@answers)
    User.create!(firstname: @infos["28860463"], lastname: @infos["28860464"], email: @infos["28860465"])
    render nothing: true
  end

  def ugc
    # if @data["form_response"]["form_id"] == "QyqJ49"
    #   ugc
    # else 
    #   ugc
    # end
  end

  private

  def set_data
    request.headers['Content-Type'] == 'application/json' ? @data = JSON.parse(request.body.read) : @data = params.as_json
    render nothing: true, status: 200 if @data == {}
  end

  def get_user_infos(array)
    hash = {} 
    array.each do |q|
      types = ['text', 'email']
      type = q['type']
      hash[q["field"]["id"]] = q[type] if types.include?(type)
    end
    hash
  end

  # def ugc
  #   @answers = answers_to_hash(@data["form_response"]["answers"]) 
  #   @id = @data["form_response"]["hidden"]["id"].to_i
  #   @user = User.where(id: @id)
  #   @user.firstname = @answers["25108292"]
  #   @user.lastname = @answers["25108413"]
  #   @user.email = @answers["25423473"]
  #   @user.address = @answers["25423131"]
  #   @user.zipcode = @answers["25424220"]
  #   @user.city = @answers["25424218"]
  #   @service = @data["form_response"]["hidden"]["service"]
  #   @unsub = Unsub.create!(user: @user, service_id: @service, form_complete: @data)
  # end

  # def answers_to_hash(array)
  #   hash = {} 
  #   array.each do |q|
  #     types = ['text', 'email']
  #     type = q['type']
  #     if types.include?(type)
  #       hash[q["field"]["id"]] = q[type]
  #     elsif type == 'choice'
  #       hash[q['field']['id']] = q["choice"]
  #     end
  #   end
  #   return hash
  # end
end