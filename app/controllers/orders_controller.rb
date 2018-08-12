class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if !Rails.env.production?
      byebug
    end
    @orders = Order.includes(:product).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

end
