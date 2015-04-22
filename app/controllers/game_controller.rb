class GameController < ApplicationController
  def index
  end

  def create
    @@dice = Dice.new(6, 2)
    redirect_to game_index_path
  end

  def rolldice
    if @@dice.rolls_left?
      @roll = @@dice.roll
    else
      @@dice = Dice.new(6, 2)
      rolldice
    end
  end
end
