class Dice
  
  def initialize(sides, number_of_dice)
    @sides = []
    number_of_dice.times do
      @sides << (1..sides).to_a
    end
    @sides.flatten!
    @dice_roll_possibilities = @sides.combination(number_of_dice).to_a
    @dice_roll_possibilities.uniq!
  end

  def rolls_left?
    if @dice_roll_possibilities.length > 0
      return true
    else
      return false
    end
  end
  
  def roll
    roll = @dice_roll_possibilities.sample
    p @dice_roll_possibilities
    @dice_roll_possibilities.delete(roll)
  end
end
