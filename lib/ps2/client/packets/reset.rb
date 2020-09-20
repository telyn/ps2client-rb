require "ps2/client/packet"

module PS2
  module Client
    module Packets
      class Reset < Packet
        def initialize
          super(:reset)
        end

        def body
          nil
        end
      end
    end
  end
end
