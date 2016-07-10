require 'test/unit'
require 'merzu'
require 'pry'

class SchemesTest < Test::Unit::TestCase
  def test_sanity
    assert_equal 2, 1 + 1
  end

  def test_bengali
    assert_equal Merzu::Schemes.new("বাংলা লিপি").find_schemes, [:bengali]
  end

  def test_devanagari
    assert_equal Merzu::Schemes.new("देवनागरी").find_schemes, [:devanagari]
  end
end
