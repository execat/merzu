require 'test/unit'
require 'letter_to_meru'
require 'pry'

class LetterToMeruTest < Test::Unit::TestCase
  def test_sanity
    assert_equal 2, 1 + 1
  end

  def test_version
    # Check if version is correct
    assert_not_nil LetterToMeru::VERSION
    assert_true LetterToMeru::VERSION.class == String
  end

  def test_creation_of_transliterate_objects
    # Check if objects are created
    assert_not_nil  LetterToMeru::Transliterate.new("कशी आहेस?", :devanagari)

    # Check private #valid
    assert_true     LetterToMeru::Transliterate.new("कशी आहेस?", :devanagari).send(:valid?)
    assert_false    LetterToMeru::Transliterate.new("कशी आहेस?", :lol).send(:valid?)
  end

  def test_return_value_types_of_transliterate_to
    # For Devanagari to IAST, Devanagari to Malayalam
    obj1 = LetterToMeru::Transliterate.new("कशी आहेस?", :devanagari)
    assert_true obj1.transliterate_to(:iast).class == String
    assert_true obj1.transliterate_to(:malayalam).class == String

    # For IAST to others
    obj2 = LetterToMeru::Transliterate.new("kaśī āhesa?", :iast)
    assert_true obj2.transliterate_to(:malayalam).class == String

    # For invalid entries
    obj3 = LetterToMeru::Transliterate.new("कशी आहेस?", :devanagari)
    assert_false catch(NotImplementedError) {
      obj3.transliterate_to(:invalid).class
    } == String
  end
end
