class GameController < ApplicationController
  def index
    @roll = @@dice.roll
  end

  def create
    @@dice = Dice.new(6, 2)
    redirect_to game_index_path
  end

  # def #Custom route
  #   #have roll dice button
  #   #AJAX call to roll dice 

  #   @dice.roll
  # end


end
