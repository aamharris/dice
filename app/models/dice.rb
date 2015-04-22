class Dice
  
  def initialize(sides, number_of_dice)
    @sides = []
    number_of_dice.times do
      @sides << (1..sides).to_a
    end
    @sides.flatten!
    @dice_roll_possibilities = @sides.combination(number_of_dice).to_a
  end

  def rolls_left?
    if @dice_roll_possibilities.length >= 1
      return true
    else
      return false
    end
  end
  
  def roll
    roll = @dice_roll_possibilities.sample
    @dice_roll_possibilities.delete(roll)
    return roll
  end
end
