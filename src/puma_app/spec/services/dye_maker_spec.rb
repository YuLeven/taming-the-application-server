# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DyeMaker do
  describe 'constructor' do
    subject { described_class.new(secret_word) }
    let(:secret_word) { 'hush now' }

    it 'should set the secret word' do
      expect(subject.send(:secret_word)).to eq secret_word
    end
  end

  describe 'make' do
    before { allow(Faraday).to receive(:get).and_return(expected_response) }
    subject { described_class.new(secret_word).make(number_of_bottles_to_make) }

    let!(:response_struct) { Struct.new(:body) }
    let(:secret_word) { 'secret, eh?' }
    let(:dye) { { 'colour' => 'red' } }
    let(:expected_response) { response_struct.new(dye.to_json) }
    let(:number_of_bottles_to_make) { rand(10) }

    let(:expected_response_array) do
      (1..number_of_bottles_to_make).map { dye }
    end

    context 'when using' do
      context 'the normal sync route' do
        it 'builds a bunch of dyes as instructed' do
          expect(subject.size).to eq number_of_bottles_to_make
          is_expected.to match expected_response_array
        end
      end

      context 'cheats' do
        before { stub_const('DyeMaker::SECRET_WORD_TO_GO_FAST', secret_word) }

        it 'builds a bunch of dyes as instructed, but with soul' do
          expect(Thread).to receive(:new).exactly(number_of_bottles_to_make)
                                         .times
                                         .and_call_original

          expect(subject.size).to eq number_of_bottles_to_make
          is_expected.to match expected_response_array
        end
      end
    end
  end
end
