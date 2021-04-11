class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting_bottle, end_bottle)
    verses_list = (end_bottle..starting_bottle).map { |i| verse(i) }.reverse
    verses_list.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)

    "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " +
    "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  private

  def successor(number)
    BottleNumber.new(number).successor
  end

  def action(number)
    BottleNumber.new(number).action
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def container(number)
    BottleNumber.new(number).container
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    if number.zero?
      99
    else
      number - 1
    end
  end

  def action
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def quantity
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end
end
