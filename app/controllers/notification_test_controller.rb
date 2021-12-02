class NotificationTestController < ApplicationController
  def index
  end

  def send_notification
    Rails.logger.info('Message to user ' + params[:user] + ': ' + params[:content])
    ActionCable.server.broadcast "room_channel", { content: params[:content],
      username: params[:user] }
  end

end
