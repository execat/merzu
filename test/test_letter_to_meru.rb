require 'test/unit'
require 'letter_to_meru'

class LetterToMeruTest < Test::Unit::TestCase
  def test_sanity
    assert_equal 2, 1 + 1
  end

  def test_version
    assert_true LetterToMeru::VERSION
  end
end
