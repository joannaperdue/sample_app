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
                receipt_email: @user.email
            )

        if charge.paid
            Order.create(
              product_id: @product.id,
              user_id: @user.id,
              total: @product.price
            )
            UserMailer.order_created(@user,@product).deliver_now
            @notice = "Your payment was processed successfully."
        end

        rescue Stripe::CardError => e
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end
        redirect_to product_path(@product)
    end
end
