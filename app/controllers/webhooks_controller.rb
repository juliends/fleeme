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
      p false
    end
    
    render nothing: true
  end

  def ugc
    # p request.body.read
    # p data["event_id"]
    # p data["event_type"]
    # p["form_response"]["form_id"]
    # p["form_response"]["hidden"]["session"]
    
  end

end

