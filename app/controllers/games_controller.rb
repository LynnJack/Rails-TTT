class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.save

    redirect_to game_path(@game)
  end
  
  def update_board
    @game = Game.last
    a = params[:row].to_i
    b = params[:column].to_i
    if @game.counter.even? && !@game.board[a][b]
      @game.board[a][b] = 'O'
      @game.counter +=1
    elsif !@game.board[a][b]
      @game.board[a][b] = 'X'
      @game.counter +=1
    end
    @game.save
    redirect_to game_path(@game)
  end

  def show
    @game = Game.last
    winning_conditions
  end

  def winning_conditions

    square1 = @game.board[0][0]
    square2 = @game.board[0][1]
    square3 = @game.board[0][2]
    square4 = @game.board[1][0]
    square5 = @game.board[1][1]
    square6 = @game.board[1][2]
    square7 = @game.board[2][0]
    square8 = @game.board[2][1]
    square9 = @game.board[2][2]

    wins = [[square1, square2, square3], [square4, square5, square6], [square7, square8, square9], [square1, square4, square7], [square2, square5, square8], [square3, square6, square9], [square1,square5, square9], [square3, square5, square7]]

    if wins.any? { |line| line.all? { |square| square == 'X' }} || wins.any? { |line| line.all? { |square| square == 'O' }}
      @winning_statement = "You won"
      @winner = ""
    elsif @game.board.any? { |array| array.include?(nil) }
      @winning_statement = "Game in session"
    else
      @winning_statement = "It's a tie"
    end
  end

end