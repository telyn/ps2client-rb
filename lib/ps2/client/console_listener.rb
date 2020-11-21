require "eventmachine"
require "ps2/client/events"

module PS2
  module Client
    # Listens on the ps2 console port
    # eventually you'll be able to subscribe to notices that particular messages
    # have arrived
    module ConsoleListener
      include EM::Protocols::LineProtocol
      include Events

      CONSOLE_PORT = 0x4712
      EVENTS = %i[stdout ps2link_boot program_exit].freeze

      def self.listen!(&block)
        EM.open_datagram_socket("0.0.0.0", CONSOLE_PORT, self) do |listener|
          listener.instance_exec(&block)
        end
      end

      def self.included(klass)
        # instance eval?
        klass.include EM::Protocols::LineProtocol
        klass.include Events
      end

      def receive_line(line)
        line = line.strip
        fire_callbacks(:stdout, line)
        received_ps2link_boot if line == "EE: Cmd thread"
        check_for_program_exit(line)
      end

      private

      def check_for_program_exit(line)
        match = /^Cmd ret: ([0-9]+)/.match(line)
        received_program_exit(match[1]) if match
      end

      def received_program_exit(exit_code)
        fire_callbacks(:program_exit, exit_code)
      end

      def received_ps2link_boot
        fire_callbacks(:ps2link_boot)
      end
    end
  end
end
