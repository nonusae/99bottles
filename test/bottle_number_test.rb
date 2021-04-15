gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bottles'

class BottleNumberTest < Minitest::Test
  def test_retur_correct_bottle_number_for_given_number
    # 0, 1, 6 are special
    assert_equal BottleNumber0, BottleNumber.for(0).class
    assert_equal BottleNumber1, BottleNumber.for(1).class
    assert_equal BottleNumber6, BottleNumber.for(6).class

    # Other number return default BottleNumber
    assert_equal BottleNumber, BottleNumber.for(3).class
    assert_equal BottleNumber, BottleNumber.for(7).class
    assert_equal BottleNumber, BottleNumber.for(47).class
  end
end
