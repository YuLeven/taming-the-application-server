# frozen_string_literal: true

module SleepingElephant
  MAX_OPEN_DATABASE_CONNS = 5
  ELEPHANT_NAP_LENGTH_IN_SECONDS = 3

  module_function

  def sleep_elephant
    statement = <<-SQL
      select pg_sleep(#{ELEPHANT_NAP_LENGTH_IN_SECONDS});
      select trunc(random() * 100) as elephant;
    SQL

    BrassDirigible.connection.execute(statement)&.to_a
  end

  def sleep_in_herds(of:)
    Rails.logger.info('Are a group of elephants a herd?')

    (1..of).each_slice(MAX_OPEN_DATABASE_CONNS).map do |herd_slice|
      herd_slice.map { Thread.new { sleep_elephant } }
                .map(&:value)
    end.flatten
  end
end
