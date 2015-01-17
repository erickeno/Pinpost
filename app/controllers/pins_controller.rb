class PinsController < ApplicationController
  before_action :set_board
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def new
    @pin = @board.pins.build
  end

  def create
    @pin = @board.pins.build(pin_params)
    if @pin.save
      flash[:notice]= "Pin has been created."
      redirect_to [@board, @pin]
    else
      flash[:alert]= "Pin has not been created."
      render 'new'
    end
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_pin
    @pin = @board.pins.find(params[:id])
  end

  def pin_params
    params.require(:pin).permit(:name, :image)
  end
end