# coding: us-ascii
# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Hash::Diff do
  let!(:old) { { a: 8, b: 9, c: 2, d: 3 } }
  let!(:new) { { a: 1, b: 9, d: 2, x: 7 } }

  let!(:diff) { Hash.Diff old, new }

  describe '#updated' do
    it { expect(diff.updated).to eq(a: 1, c: 2, d: 2, x: 7) }
  end

  describe '#deleted' do
    it { expect(diff.deleted).to eq(c: 2) }
  end

  describe '#appended' do
    it { expect(diff.appended).to eq(x: 7) }
  end

  describe '#kept' do
    it { expect(diff.kept).to eq(b: 9) }
  end

  describe '#value_updated' do
    it { expect(diff.value_updated).to eq(a: 1, d: 2) }
  end

  describe '#inspect' do
    it { expect(diff.inspect).to be_an_instance_of(String) }
  end
end
