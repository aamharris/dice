class Game
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end

  attr_accessor :players, :player_1, :player_2, :name, :players_turn

  def initialize(players_turn)
    @players = [player_1 = Player.new(name = "Player 1", Dice.new(6,2)),
                player_2 = Player.new(name = "Player 2", Dice.new(6,2))]
    @players_turn = players_turn
  end
end