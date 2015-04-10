class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.save

    redirect_to game_path(@game)
  end
  
  def update_board
    
  end

  def show
    
  end


end
