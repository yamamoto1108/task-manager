class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:content, :room_id).merge(user_id: current_user.id))
      redirect_to room_path(@message.room.id)
    else
      redirect_back(fallback_location: user_path(current_user.id))
    end
  end
end
