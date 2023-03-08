class PersonChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "person_#{params[:person_id]}_channel"
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

    ActionCable.server.broadcast 'person_channel', { user: }
  end
    
end
