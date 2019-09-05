# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SleepingElephant do
  before { stub_const('SleepingElephant::ELEPHANT_NAP_LENGTH_IN_SECONDS', 0.1) }

  describe 'sleep_elephant' do
    subject(:elephant_nap) { described_class.sleep_elephant }
    it 'puts one elephant to sleep and gives its dream number as a return' do
      expect(elephant_nap.size).to eq 1
      fully_rested_elephant = elephant_nap.first['elephant']

      expect(fully_rested_elephant).to be_kind_of Float
      expect(fully_rested_elephant).to be >= 0
    end
  end

  describe 'sleep_in_herds' do
    subject(:sleep_in_herds) { described_class.sleep_in_herds(of: elephants_to_sleep) }
    let(:elephants_to_sleep) { 12 }

    it 'puts a flock, herd, pack or whatever a group of elephants is to sleep' do
      expect(sleep_in_herds.size).to eq 12
      sleep_in_herds.each do |elephant_enclosure|
        fully_rested_elephant = elephant_enclosure['elephant']

        expect(fully_rested_elephant).to be_kind_of Float
        expect(fully_rested_elephant).to be >= 0
      end
    end
  end
end
