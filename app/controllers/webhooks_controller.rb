class WebhooksController < ApplicationController
  # Ici il faut annuller la vérification des tokens qui protège toute app rails d' attaques csrf
  # Les deux lignes suivantes ont le même effet
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token

  def receive 
    # Typeform attend une réponse de notre controlleur pour valider la route
    if request.headers['Content-Type'] == 'application/json'
      @data = JSON.parse(request.body.read)
    else
      @data = params.as_json
    end

    if @data["form_response"]["form_id"] == "QyqJ49"
      ugc
    else 
      # On pourra ici ajouter les id d' autres forms Typeform
      false
    end
    render nothing: true
  end

  def ugc
    @answers = answers_to_hash(@data["form_response"]["answers"]) 
    @user = User.new
    @user.firstname = @answers["25108292"]
    @user.lastname = @answers["25108413"]
    @user.email = @answers["25423473"]
    @user.address = @answers["25423131"]
    @user.zipcode = @answers["25424220"]
    @user.city = @answers["25424218"]
    @user.session_id = @data["form_response"]["hidden"]["session"]
    @user.save

    @service = @data["form_response"]["hidden"]["service"]
    @unsub = Unsub.create!(user: @user, service_id: @service, form_complete: @data)
  end

  def answers_to_hash(array)
    hash = {} 
    array.each do |q|
      types = ['text', 'email']
      type = q['type']
      if types.include?(type)
        hash[q["field"]["id"]] = q[type]
      elsif type == 'choice'
        hash[q['field']['id']] = q["choice"]
      end
    end
    return hash
  end
end