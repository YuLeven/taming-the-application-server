# frozen_string_literal: true

class BenchmarkController < ApplicationController
  def sleeper
    sleep 5

    render json: ['Ahoy!']
  end

  def sync_blocker
    render json: ExponentialThing.new(places: 35).call
  end

  def synchronous_io
    render json: DyeMaker.new.make(10)
  end

  def concurrent_io
    render json: DyeMaker.new("Oh, oh, you don't have to go (slowly)").make(10)
  end

  def synchronous_active_record
    render json: SleepingElephant.sleep_elephant
  end

  def concurrent_active_record
    render json: SleepingElephant.sleep_in_herds(of: 10)
  end
end
