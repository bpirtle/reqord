require "reqord/version"

module Reqord

  def initialize(app)
    @reqord = {}
    @app = app
  end

  def call(env)
    dup.tsafe_call(env)
  end

  def tsafe_call(env)
    request_started_on = Time.now
    @status, @headers, @response = @app.call(env)
    request_ended_on = Time.now

    @reqord['time'] = request_ended_on - request_started_on

    [@status, @headers, @response]

    pp @reqord
  end
end
