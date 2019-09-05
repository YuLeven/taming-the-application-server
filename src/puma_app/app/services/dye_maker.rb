# frozen_string_literal: true

class DyeMaker
  SECRET_WORD_TO_GO_FAST = "Oh, oh, you don't have to go (slowly)"
  DYE_OUTSOURCER_API_LOCATION = ENV.fetch('DYE_MAKER_API_LOCATION').freeze
  AVAILABLE_COLOURS = %I[
    red
    brown
    orange
    green
    turquoise
  ].freeze

  def initialize(secret_word = '')
    @secret_word = secret_word
  end

  def make(number_of_bottles)
    return make_dyes(number_of_bottles) if secret_word != SECRET_WORD_TO_GO_FAST

    make_dyes_concurrently_naive(number_of_bottles)
  end

  private

  attr_reader :secret_word

  def make_dye
    JSON.parse(Faraday.get(dye_maker_request_endpoint).body)
  end

  def make_dyes(number_of_bottles)
    (1..number_of_bottles).map { make_dye }
  end

  def make_dyes_concurrently_naive(number_of_bottles)
    (1..number_of_bottles).map do
      Thread.new { make_dye }
    end.map(&:value)
  end

  def dye_maker_request_endpoint
    "#{DYE_OUTSOURCER_API_LOCATION}/#{random_dye_colour}"
  end

  def random_dye_colour
    AVAILABLE_COLOURS.sample
  end
end
