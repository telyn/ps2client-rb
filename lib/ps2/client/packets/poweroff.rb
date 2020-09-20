require "ps2/client/packet"

module PS2
  module Client
    module Packets
      class PowerOff < Packet
        def initialize
          super(:poweroff)
        end

        def body
          nil
        end
      end
    end
  end
end
