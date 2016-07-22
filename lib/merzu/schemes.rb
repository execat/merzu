class Merzu::Schemes
  # ::schemes
  #
  # Returns an array of all the supported languages
  def self.schemes
    %w{ Bengali Devanagari Gujarati Gurmukhi Kannada Malayalam Oriya Tamil Telugu }
  end

  # ::new(text)
  #
  # Initialize the Transliteration object
  #   eg. Merzu::Schemes.new("कशी आहेस?")
  def initialize(text)
    @text = text
  end

  # ::find_schemes
  #
  # Find scheme of the text
  #   eg. find_scheme
  #
  # To find a scheme, we use the regex standard to match the schemes from the
  # list. Occurrence of any character in the text that falls into the range will
  # result in a match
  #
  # TODO: Allow `find_schemes` to accept an acceptance ratio double as opts that
  # will add the scheme in the returned array only if the characters exceed the
  # ratio of the characters in the language to the total number of characters in
  # text
  def find_schemes
    return NotImplementedError unless text
    self.class.schemes.map do |scheme|
      scheme.downcase.to_sym if text =~ Regexp.new("\\p{#{scheme}}")
    end.compact
  end

  private
  attr_accessor :text
end
