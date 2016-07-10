require 'spec_helper'

RSpec.describe Merzu do
  describe '::VERSION' do
    subject { Merzu::VERSION }
    it { is_expected.to be_a String }
    it { is_expected.to include "." }
  end
end
