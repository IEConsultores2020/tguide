class TrackChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #stream_from "track_#{params[:track_id]}_channel"
	  stream_from "track_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def get_user_data
    data = {
      id: current_user.id,
      email: current_user.email,
      username: current_user.email.split('@')[0]
    }
  
    ActionCable.server.broadcast 'room_channel', { data:}
    
  end  
end
