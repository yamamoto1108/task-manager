class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def show
    @comment = Comment.new
    @comments = @card.comments.includes(:user).order("created_at DESC")
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to board_path(@board)
  end

  def sort
    card = Card.find(params[:card_id])
    card.update(card_params)
    render body: nil
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :about, :deadline, :finish, :list_id, :row_order_position, images: [], user_ids: [])
  end
end
