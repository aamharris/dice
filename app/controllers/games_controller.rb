class GamesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @@game = Game.new(0)

    redirect_to games_path
  end

  def rolldice
    @player = @@game.players[@@game.players_turn]
    if @player.dice.rolls_left?
      @roll = @player.dice.roll
    else
      @player.dice = Dice.new(6, 2)
      rolldice
    end

    if @@game.players_turn == 0
      @@game.players_turn += 1
    else
      @@game.players_turn = 0
    end

    return @roll
  end
end
