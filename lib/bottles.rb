class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting_bottle, end_bottle)
    verses_list = (end_bottle..starting_bottle).map { |i| verse(i)}.reverse
    verses_list.join("\n")
  end

  def verse(start_bottle)
    "#{bottle_no(start_bottle).capitalize} #{bottle_word(start_bottle)} of beer on the wall, " +
    "#{bottle_no(start_bottle)} #{bottle_word(start_bottle)} of beer.\n" +
    buy_or_take(start_bottle) +
    "#{bottle_no(bottle_left(start_bottle))} #{bottle_word(bottle_left(start_bottle))} of beer on the wall.\n"
  end

  private

  def bottle_no(number)
    number === 0 ? 'no more' : number.to_s
  end

  def bottle_word(number)
    case number
    when 1
      'bottle'
    when 0
      'bottles'
    else
      'bottles'
    end
  end

  def buy_or_take(number)
    case number
    when 1
      "Take it down and pass it around, "
    when 0
      "Go to the store and buy some more, "
    else
      "Take one down and pass it around, "
    end
  end

  def bottle_left(start_bottle)
    start_bottle == 0 ? 99 : start_bottle - 1
  end
end
