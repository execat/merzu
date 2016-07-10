class LetterToMeru::Transliterate
  # ::valid_scripts
  #
  # List of valid scripts
  def self.valid_scripts
    [:devanagari, :iast, :malayalam]
  end

  # ::new(text, source_script)
  #
  # Initialize the Transliterate object
  #   eg. LetterToMeru::Transliterate.new("कशी आहेस?", :devanagari)
  def initialize(text, source_script)
    @text = text
    @source_script = source_script
  end

  # #transliterate(target_script)
  #
  # Transliterate from one script to another
  #   eg. transliterate_to(:malayalam)
  #
  # The mappings are defined with respect to IAST. So a mapping like Devanagari
  # to Malayalam will be done as follows:
  #
  #   Devanagari -> IAST -> Malayalam
  #
  # Additional rules can be passed in opts. Passed rules hold precedence over
  # the prebuilt rules.
  def transliterate_to(target_script, opts={})
    # TODO: Throw some sensible error if target_script is not in valid scripts
    throw NotImplementedError unless self.class.valid_scripts.include? target_script

    if target_script == :iast
      # If target script is IAST, use the private method to transliterate to
      # IAST
      return transliterate_to_iast

    elsif source_script == :iast
      # If source script is IAST, use the private method to transliterate to the
      # input method
      return transliterate_from_iast_to target_script

    else
      # If none of the source or target script is :iast, get the IAST
      # representation of the source text and feed that representation to a new
      # Transliterate object, and call transliterate_to on it with the target
      # script
      iast_str = transliterate_to :iast
      iast_object = LetterToMeru::Transliterate.new(iast_str, :iast)
      return iast_object.transliterate_to(:malayalam)
    end
  end

  private

  # #text
  # #source_script
  #
  # Make the getters `text` and `source_script` available in the class
  attr_reader :text, :source_script

  # #transliterate_to_iast
  #
  # Transliterate the text in source_script to IAST
  def transliterate_to_iast
    ""
  end

  # #transliterate_from_iast_to
  #
  # Transliterate the current IAST source text to the given target script.
  #
  # Exception conditions:
  #   Throw an error if the source_script is not IAST
  def transliterate_from_iast_to(target_script)
    # TODO: Throw some sensible error if source_script is not "IAST"
    throw NotImplementedError if source_script != :iast
    ""
  end

  # #valid
  #
  # At any point, return if the state of the Transliterate object is valid
  def valid?
    return true if text && self.class.valid_scripts.include?(source_script)
    false
  end
end
