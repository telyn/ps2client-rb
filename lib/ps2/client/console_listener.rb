require "eventmachine"

module PS2
  module Client
    # Listens on the ps2 console port
    # eventually you'll be able to subscribe to notices that particular messages
    # have arrived
    module ConsoleListener
      include EM::Protocols::LineProtocol
      CONSOLE_PORT = 0x4712

      def self.listen!
        EM.open_datagram_socket("0.0.0.0", CONSOLE_PORT, self)
      end

      def receive_line(line)
        puts line
        if line == PS2LINK_READY_MESSAGE
        end
      end
    end
  end
end
