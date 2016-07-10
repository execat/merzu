require 'spec_helper'

RSpec.describe Merzu::Transliteration do
  describe 'creation of valid objects' do
    subject { Merzu::Transliteration.new("कशी आहेस?", :devanagari) }
    context '#valid' do
      it { expect(subject.send(:valid?)).to eq true }
    end
  end

  describe 'creation of invalid objects' do
    subject { Merzu::Transliteration.new("मनी माऊ, मनी माऊ, अंग तुझे मऊ मऊ.", :lol) }
    context '#valid' do
      it { expect(subject.send(:valid?)).to eq false }
    end
  end

  describe 'return value types of transliterate_to' do
    subject { Merzu::Transliteration.new("कधी रे येशील तू?", :devanagari) }
    context '#transliterate_to :iast (to IAST)' do
      it { expect(subject.transliterate_to :iast).to be_a String }
    end
    context '#transliterate_to :devanagari (to self)' do
      it { expect(subject.transliterate_to :devanagari).to be_a String }
    end
    context '#transliterate_to :malayalam (to third language)' do
      it { expect(subject.transliterate_to :malayalam).to be_a String }
    end
  end

  describe 'return value types of transliterate_to from iast' do
    subject { Merzu::Transliteration.new("kaśī āhesa?", :iast) }
    context '#transliterate_to :devanagari' do
      it { expect(subject.transliterate_to :devanagari).to be_a String }
    end
    context '#transliterate_to :invalid' do
      it { expect(subject.transliterate_to :invalid).to_raise error }
    end
  end
end
