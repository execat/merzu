class Merzu::Schemes
  # ::schemes
  #
  # Returns a hash with languages and their Unicode codes
  def self.schemes
    %w{ Bengali Devanagari Gujarati Gurmukhi Kannada Malayalam Oriya Tamil Telugu }
  end

  def initialize(text)
    @text = text
  end

  def find_schemes
    return NotImplementedError unless text
    self.class.schemes.map do |scheme|
      scheme.downcase.to_sym if text =~ Regexp.new("\\p{#{scheme}}")
    end.compact
  end

  private
  attr_accessor :text
end
