gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/count_down_song'

class CountDownSongTest < Minitest::Test
  class VerseFake
    def self.lyrics(number)
      "This is verse #{number}.\n"
    end
  end

  def test_verse
    expected =
      "This is verse 500.\n"

    assert_equal(
      expected,
      CountDownSong.new(verse_template: VerseFake).verse(500)
    )
  end

  def test_verses
    expected =
    "This is verse 99.\n" +
    "\n" +
    "This is verse 98.\n" +
    "\n" +
    "This is verse 97.\n"

    assert_equal(
      expected,
      CountDownSong.new(verse_template: VerseFake).verses(99, 97)
    )
  end

  def test_the_whole_song
    expected =
    "This is verse 60.\n" +
    "\n" +
    "This is verse 59.\n" +
    "\n" +
    "This is verse 58.\n" +
    "\n" +
    "This is verse 57.\n" +
    "\n" +
    "This is verse 56.\n"

    assert_equal(
      expected,
      CountDownSong.new(verse_template: VerseFake, max: 60, min: 56).song
    )
  end
end
