module Reqord
  class Rack::Timeout
    if defined?(Rails) && [3,4,5,6].include?(Rails::VERSION::MAJOR)
      class Rack::Timeout::Railtie < Rails::Railtie
        initializer('rack-timeout-reqord.prepend') { |app| app.config.middleware.insert_before(Rack::Timeout, Rack::Timeout::Reqord) }
      end
    end

    class Rack::Timeout::Reqord
      def initialize(app, options = {})
        @app, @options = app, options
      end

      class Error < StandardError; end

      def call(env)
        @app.call(env)
      rescue Rack::Timeout::Error => e
        # Save error, but then re-raise it

        raise
      end
    end
  end
end
