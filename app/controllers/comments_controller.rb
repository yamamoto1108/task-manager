class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to board_path(@board) }
      format.json
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, card_id: params[:card_id])
  end
end
