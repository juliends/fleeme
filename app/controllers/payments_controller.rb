class PaymentsController < ApplicationController
  before_action :set_unsub

  def new

  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @unsub.amount_cents, # or amount_pennies
      description:  "Paiement pour lettre résiliation du service #{@unsub.teddy_sku} - Commande n°#{@unsub.id}",
      currency:     "EUR"
    )

    @unsub.update(payment: charge.to_json, state: 'paid')
    # A REVOIR - AJOUTER STATE A UNSUB. IDEM POUR PAIEMENT ?
    redirect_to unsub_path(@unsub)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_unsub_payments_path(@unsub)
    end
  end

  private

  def set_unsub
    @unsub = Unsub.find(params[:unsub_id])
  end

end
