# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExponentialThing do
  describe 'call' do
    let(:limit) { nil }
    subject { described_class.new(places: limit).call }

    context 'when a limit was' do
      context 'passed in' do
        let(:limit) { 10 }

        it 'slowly calculates fibs up to the limit' do
          expect(subject.size).to be 10
          is_expected.to match_array [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end
      end

      context 'not passed in' do
        it 'slowly calculates fibs up to 30' do
          expect(subject.size).to be 30
        end
      end
    end
  end
end
