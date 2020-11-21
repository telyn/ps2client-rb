require "eventmachine"

module PS2
  module Client
    class PS2LinkListener
      EVENTS = %i[stdout ps2link_boot program_exit].freeze
      include EventMachine::Protocols::LineProtocol

      def on(event, &block)
        callbacks[event] << block
        self
      end

      def receive_line(line)
        line = line.strip
        call_event_listeners(:stdout, line)
        received_ps2link_boot if line == "EE: Cmd thread"
        check_for_program_exit(line)
      end

      private

      def check_for_program_exit(line)
        match = /^Cmd ret: ([0-9]+)/.match(line)
        received_program_exit(match[1]) if match
      end

      def received_program_exit(exit_code)
        call_event_listeners(:program_exit, exit_code)
      end

      def received_ps2link_boot
        call_event_listeners(:ps2link_boot)
      end

      def call_event_listeners(event, *args)
        callbacks[event].each do |cb|
          cb.call(*args)
        end
      end

      def callbacks
        @callbacks ||= Hash[EVENTS.map { |e| [e, []] }]
      end
    end
  end
end
