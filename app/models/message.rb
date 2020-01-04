class Message < ApplicationRecord
  after_create_commit { ActionCable.server.broadcast 'room_channel', msg: render_message }

  private

  def render_message
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end
end
