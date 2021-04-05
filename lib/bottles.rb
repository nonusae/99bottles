class Bottles
  NoMore = lambda do |_|
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
  end

  LastOne = lambda do |_|
      "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
  end

  NearlyLastOne = lambda do |_|
      "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
  end

  Default = lambda do |verse|
    "#{verse.number} bottles of beer on the wall, " +
    "#{verse.number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{verse.number - 1} bottles of beer on the wall.\n"
  end

  def song
    verses(99, 0)
  end

  def verses(starting_bottle, end_bottle)
    verses_list = (end_bottle..starting_bottle).map { |i| verse(i) }.reverse
    verses_list.join("\n")
  end

  def verse(number)
    verse_for(number).text
  end

  def verse_for(number)
    case number
    when 0
      Verse.new(number, &NoMore)
    when 1
      Verse.new(number, &LastOne)
    when 2
      Verse.new(number, &NearlyLastOne)
    else
      Verse.new(number, &Default)
    end
  end
end

class Verse
  attr_reader :number

  def initialize(number, &lyric)
    @number = number
    @lyric = lyric
  end

  def text
    @lyric.call self
  end
end
