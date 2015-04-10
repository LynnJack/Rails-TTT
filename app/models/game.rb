class Game < ActiveRecord::Base
  serialize :board

  def initialize
    super
    self.counter = 0
    self.board = Array.new(3).map{[nil, nil, nil]} 
  end



end

