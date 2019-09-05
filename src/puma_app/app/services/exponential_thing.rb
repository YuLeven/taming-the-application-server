# frozen_string_literal: true

class ExponentialThing
  def initialize(places:)
    @places = (places&.abs) || 30
  end

  def call
    (1..places).map { |position| calculate_fibs(position) }
  end

  private

  attr_reader :places

  def calculate_fibs(position)
    return position if [0, 1].include? position

    calculate_fibs(position - 1) + calculate_fibs(position - 2)
  end
end
