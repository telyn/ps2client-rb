require "ps2/client/packet"

module PS2
  module Client
    module Packets
      class StartVU < Packet
        def initialize(vu)
          @vu = vu
          super(:startvu)
        end

        def body
          [vu].pack("l>")
        end

        attr_reader :vu
      end
    end
  end
end
