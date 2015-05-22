class Player

  attr_accessor :name, :dice

  def initialize(name, dice)
    @name = name
    @dice = dice
  end

  def players_turn
    @dice.roll
  end

end
