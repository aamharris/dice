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

  def self.rolls_left?(dice_arry)
    if dice_arry.length > 0
      return true
    else
      return false
    end
  end
  
  def self.roll(dice_arry)
    roll = dice_arry.sample
    dice_arry.delete(roll)
  end

  def self.new_dice_set(sides, number_of_dice)
    @sides = []
    number_of_dice.times do
      @sides << (1..sides).to_a
    end

    @sides.flatten!
    @dice_roll_possibilities = @sides.combination(number_of_dice).to_a
    return @dice_roll_possibilities.uniq!
  
  end
end
