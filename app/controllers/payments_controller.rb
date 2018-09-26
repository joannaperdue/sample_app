class PaymentsController < ApplicationController
  before_action :authenticate_user!

    def create
        @product = Product.find(params[:product_id])
        @user = current_user

        token = params[:stripeToken]
        begin
            charge = Stripe::Charge.create(
                amount: (@product.price*100).to_i,
                currency: "usd",
                source: token,
                description: params[:stripeEmail]
            )

        if charge.paid
            Order.create(
              product_id: @product.id,
              user_id: @user.id,
              total: @product.price
            )
            flash[:alert]= "Your payment was processed successfully."
            UserMailer.order_notification(@user,@order).deliver_now

        end

        rescue Stripe::CardError => e
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end
        redirect_to product_path(@product)
    end
end
