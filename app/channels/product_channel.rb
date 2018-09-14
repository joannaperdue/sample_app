class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "product_channel"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def listen
    stop_all_streams (data)
    stream_for data["product_id"]
  end
end
