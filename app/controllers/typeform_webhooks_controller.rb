class TypeformWebhooksController < ApplicationController
  protect_from_forgery

  def receive
    render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end



end

