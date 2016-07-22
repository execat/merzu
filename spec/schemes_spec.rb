require 'spec_helper.rb'

RSpec.describe Merzu::Schemes do
  describe 'for Bengali text' do
    subject { Merzu::Schemes.new("বাংলা লিপি").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:bengali] }
    end
  end

  describe 'for Devanagari text' do
    subject { Merzu::Schemes.new("देवनागरी").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:devanagari] }
    end
  end

  describe 'for Gujarati text' do
    subject { Merzu::Schemes.new("ગુજરાતી").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:gujarati] }
    end
  end

  describe 'for Gurmukrhi text' do
    subject { Merzu::Schemes.new("ਆਲੂ").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:gurmukhi] }
    end
  end

  describe 'for Kannada text' do
    subject { Merzu::Schemes.new("ಕನ್ನಡ").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:kannada] }
    end
  end

  describe 'for Malayalam text' do
    subject { Merzu::Schemes.new("മലയാളം").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:malayalam] }
    end
  end

  describe 'for Oriya text' do
    subject { Merzu::Schemes.new("ଓଡ଼ିଆ").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:oriya] }
    end
  end

  describe 'for Tamil text' do
    subject { Merzu::Schemes.new("தமிழ்").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:tamil] }
    end
  end

  describe 'for Telugu text' do
    subject { Merzu::Schemes.new("తెలుగు").find_schemes }
    context '#find_schemas' do
      it { is_expected.to eq [:telugu] }
    end
  end

  describe 'for multiple scripts' do
    subject { Merzu::Schemes.new("తెలుగు ਦਿਲ मांजर").find_schemes }
    context '#find_schemas' do
      it { is_expected.to include :devanagari, :gurmukhi, :telugu }
      it { is_expected.to_not include :bengali, :oriya, :malayalam }
    end
  end

  describe 'with acceptance' do
    subject { Merzu::Schemes.new("తెలుగు ਦਿ मांजर").find_schemes({ acceptance: 0.2 }) }
    context '#find_schemas' do
      it { is_expected.to include :devanagari, :telugu }
      it { is_expected.to_not include :gurmukhi }
    end
  end
end
