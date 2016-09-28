class UnsubsController < ApplicationController
  include TextConstructor
  before_action :set_unsub, only: [:show, :offers]

  def new
    @service = Service.find(params[:service_id])
    @session = session.id
    @unsub = Unsub.create!(user_id: current_user.id, price_cents: 700)
    @id = @unsub.id
  end

  def show
    @letter = Letter.create!(text: render_letter(@unsub), unsub: @unsub)
  end

  # non-CRUD actions
  def offers
  end

  private

  def set_unsub
    @unsub = Unsub.find(params[:id])
  end


end
