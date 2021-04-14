class Bottles
  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def song
    verses(99, 0)
  end

  def verses(starting_bottle, end_bottle)
    verses_list = (end_bottle..starting_bottle).map { |i| verse(i) }.reverse
    verses_list.join("\n")
  end

  def verse(number)
    verse_template.lyric(number)
  end
end

class BottleVerse
  attr_reader :number

  def self.lyric(number)
    new(number).lyric
  end

  def initialize(number)
    @number = number
  end

  def lyric
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

# Polymorophism
class BottleNumber
  attr_reader :number

  def self.registry
    @registry ||= [BottleNumber]
  end

  def self.register(candidate)
    registry.unshift(candidate)
  end

  def self.inherited(candidate)
    register(candidate)
  end

  def self.for(number)
    @registry.find { |candidate| candidate.handle?(number) }.new(number)
  end

  def self.handle?(_)
    true
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def quantity
    number.to_s
  end

  def pronoun
    'one'
  end

  def container
    'bottles'
  end
end

class BottleNumber0 < BottleNumber
  def self.handle?(number)
    number.zero?
  end

  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def self.handle?(number)
    number == 1
  end

  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  def self.handle?(number)
    number == 6
  end

  def quantity
    '1'
  end

  def container
    'six-pack'
  end
end
