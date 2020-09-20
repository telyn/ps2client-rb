require "ps2/client/packet"

module PS2
  module Client
    module Packets
      class NetDump < Packet
        def initialize
          super(:netdump)
        end

        def body
          nil
        end
      end
    end
  end
end
