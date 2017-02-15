class Merzu::Transliteration
  # List of valid scripts
  # [:iast, :devanagari, :bengali, :gurmukhi, :gujarati, :oriya, :tamil, :telugu, :kannada, :malayalam, :singhalese]
  def self.valid_scripts
    Merzu::Data.mapping_headers.map(&:downcase).map(&:to_sym)
  end

  def initialize(text, source_script)
    @text = text
    @source_script = source_script
  end

  def transliterate_to(target_script, opts={})
    # TODO: Raise some sensible error if target_script is not in valid scripts
    raise NotImplementedError unless self.class.valid_scripts.include? target_script

    return transliterate_to_iast if target_script == :iast
    return transliterate_from_iast_to(target_script) if source_script == :iast

    iast_str = transliterate_to :iast
    iast_object = Merzu::Transliteration.new(iast_str, :iast)
    return iast_object.transliterate_to(target_script)
  end

  private
  attr_reader :text, :source_script

  def transliterate_to_iast
    iast_index = self.class.valid_scripts.index(:iast)
    iast_array = fetch_mapping_array(iast_index)
    source_index = self.class.valid_scripts.index(source_script)
    source_array = fetch_mapping_array(source_index)

    text.split("").map { |character| process(character, source_array, iast_array) }.join
  end

  def process(character, from_array, to_array)
    return " " if character == " "
    return "?" if character == "?"
    c =
      if Merzu::Data.devanagari_vowel_mappings[:vowel].index(character)
        index = Merzu::Data.devanagari_vowel_mappings[:vowel].index(character)
        Merzu::Data.devanagari_vowel_mappings[:whole][index]
      else
        character
      end
    index = from_array.index(c)
    binding.pry if index == nil
    to_array[index]
  end

  def transliterate_from_iast_to(target_script)
    # TODO: Raise some sensible error if source_script is not "IAST"
    raise NotImplementedError if source_script != :iast
    ""
  end

  def fetch_mapping_array(index)
    Merzu::Data.mapping.map { |line| line[index] }
  end

  def valid?
    return true if text && self.class.valid_scripts.include?(source_script)
    false
  end
end
