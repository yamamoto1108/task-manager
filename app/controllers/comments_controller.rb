class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    Comment.create(comment_params)
    redirect_to board_path(@board.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, card_id: params[:card_id])
  end
end
