class PurchaseService
  def initialize(user, product)
    @user = user
    @product = product
  end
  
  def process_purchase_with_stripe(token)
    @product.status = :Sold
    # payment_intent = Stripe::PaymentIntent.create(
    #   amount: @product.price * 100,
    #   currency: 'usd',
    #   payment_method_data: {
    #     type: 'card',
    #     card: {
    #       token: token
    #     }
    #   },
    #   confirmation_method: 'manual',
    #   confirm: true
    # )
    customer = Stripe::Customer.create({
      email: @user.email
    })
    payment = Stripe::PaymentIntent.create(
      customer: customer,
      # payment_source: token,
      amount: @product.price,
      currency: 'usd',
      payment_method_data: {
        type: 'card',
        card: {
          token: token
        }
      },
      confirm: true,
      confirmation_method: 'automatic'
    )
    @user.purchase_histories.create(
      product_id: @product,
      stripe_charge_id: payment.id
    )
    @product.save
  end
end
  