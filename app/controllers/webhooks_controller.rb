class WebhooksController < ApplicationController
  # Ici il faut annuller la vérification des tokens qui protège toute app rails d' attaques csrf
  # Les deux lignes suivantes ont le même effet
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token

  def receive 
    # Typeform attend une réponse de notre controlleur pour valider la route
    p request.body.read
    render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end

end

