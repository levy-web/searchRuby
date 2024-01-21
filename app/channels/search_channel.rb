class SearchChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'search_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast_data(data)
    ActionCable.server.broadcast('search_channel', data)
  end
end
