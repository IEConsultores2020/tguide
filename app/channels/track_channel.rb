# frozen_string_literal: true

class TrackChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "track_#{params[:track_id]}_channel"
    # stream_from "track_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def get_user_data
    user = {
      id: current_user.id,
      email: current_user.email,
      username: current_user.email.split('@')[0]
    }

    ActionCable.server.broadcast 'track_channel', { user: }
  end
end
