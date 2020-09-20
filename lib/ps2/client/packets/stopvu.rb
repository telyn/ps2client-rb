require "ps2/client/packet"

module PS2
  module Client
    module Packets
      class StopVU < Packet
        def initialize(vu)
          @vu = vu
          super(:stopvu)
        end

        def body
          [vu].pack("N")
        end

        attr_reader :vu
      end
    end
  end
end
