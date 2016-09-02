class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    # @email = Devise.friendly_token.first(8)
    # @user = User.create!(email: @email,  session_id: @session)
    # sign_in(:user, @user)
  end

  def show
    # Permet de récupérer le User mais risque de latence si Typeform ne répond pas rapidement
    # @session = session.id
    # current_user = User.where(session_id: @session)
    raise
  end


  private

  # if @data["form_response"]["form_id"] == "QyqJ49"
    #   ugc
    # else 
    #   ugc
    # end


  def ugc
    @answers = answers_to_hash(@data["form_response"]["answers"]) 
    @id = @data["form_response"]["hidden"]["id"].to_i
    @user = User.where(id: @id)
    @user.firstname = @answers["25108292"]
    @user.lastname = @answers["25108413"]
    @user.email = @answers["25423473"]
    @user.address = @answers["25423131"]
    @user.zipcode = @answers["25424220"]
    @user.city = @answers["25424218"]
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
