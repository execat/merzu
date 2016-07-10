require 'test/unit'
require 'letter_to_meru'
require 'pry'

class SchemesTest < Test::Unit::TestCase
  def test_sanity
    assert_equal 2, 1 + 1
  end

  def test_bengali
    assert_equal LetterToMeru::Schemes.new("বাংলা লিপি").find_schemes, [:bengali]
  end

  def test_devanagari
    assert_equal LetterToMeru::Schemes.new("देवनागरी").find_schemes, [:devanagari]
  end
end
