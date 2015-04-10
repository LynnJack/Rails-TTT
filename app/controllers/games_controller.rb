class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.save

    redirect_to game_path(@game)
  end
  
  def update_board
    @game = Game.last
    @game.counter +=1
    a = params[:row].to_i
    b = params[:column].to_i
    @game.board[a][b] = 'x'
    @game.save
    redirect_to game_path(@game)
    
  end

  def show
    
  end


end
