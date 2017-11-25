# coding: us-ascii

require_relative 'spec_helper'

RSpec.describe Hash do
  describe '.Diff' do
    it do
      a, b = {}, {}
      diff = described_class.Diff(a, b)
      expect(diff).to be_an_instance_of(Hash::Diff)
      expect(diff.old).to equal(a)
      expect(diff.new).to equal(b)
    end
  end
end