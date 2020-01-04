class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel" # if current_user.email == "mohsin@devsinc.com"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create content: data["message"], user: current_user
  end
end
