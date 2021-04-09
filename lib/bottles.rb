class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting_bottle, end_bottle)
    verses_list = (end_bottle..starting_bottle).map { |i| verse(i) }.reverse
    verses_list.join("\n")
  end

  def verse(number)
    case number
    when 0
      "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quantity(successor(number))} #{container(number-1)} of beer on the wall.\n"
    else
      "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quantity(successor(number))} #{container(number-1)} of beer on the wall.\n"
    end
  end

  private

  def successor(number)
    if number.zero?
      99
    else
      number - 1
    end
  end

  def action(number)
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def quantity(number)
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def pronoun(number)
    if number == 1
      'it'
    else
      'one'
    end
  end

  def container(number)
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end
end
