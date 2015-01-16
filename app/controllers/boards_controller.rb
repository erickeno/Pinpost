class BoardsController < ApplicationController
  def index
    @boards = Board.all 
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice]= 'Board has been created'
      redirect_to @board
    else
      flash[:alert]= 'Board has not been created.'
      render 'new'
    end
  end
  def show
    @board = Board.find(params[:id])
  end
  
  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    if @board.save
      flash[:notice]= "Board has been updated."
      redirect_to @board
    else
      flash[:alert]= "Board has not been updated."
      render 'edit'
    end
  end

  def destroy
    @board = Board.find(params[:id]).destroy
    flash[:notice] = "Board has been destroyed."
    redirect_to boards_path
  end
  
  private
  def board_params
    params.require(:board).permit(:title, :description)
  end
end
