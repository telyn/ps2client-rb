module PS2
  module Client
    # light-ish event framework that'll probably end up getting used in most of
    # my EM connections
    module Events
      class NoEventError < StandardError; end

      def on(event, &block)
        unless allowed_callbacks.include? event
          raise NoEventError, "No such event as #{event}"
        end

        callbacks[event] << block
        self
      end

      private

      def fire_callbacks(event, *args)
        callbacks[event].each do |cb|
          cb.call(*args)
        end
      end

      def callbacks
        @callbacks ||= Hash[allowed_callbacks.map { |e| [e, []] }]
      end

      def allowed_callbacks
        self.class::EVENTS || []
      end
    end
  end
end
