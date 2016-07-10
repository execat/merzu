require 'spec_helper.rb'

RSpec.describe 'Sanity test' do
  describe 'performs simple operation' do
    it 'adds as expected' do
      expect(1 + 1).to eq(2)
    end

    it 'equates as expected' do
      expect(1 == 1).to be true
    end
  end
end
