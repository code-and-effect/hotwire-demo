class MessagesController < ApplicationController
  include Effective::CrudController

  resource_scope -> { Room.find(params[:room_id]).messages }

  def permitted_params
    params.require(:message).permit(:body)
  end

end
