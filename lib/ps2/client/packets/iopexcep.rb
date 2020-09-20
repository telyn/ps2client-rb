require "ps2/client/packet"

module PS2
  module Client
    module Packets
      class IOPExcep < Packet
        def initialize
          super(:iopexcep)
        end

        def body
          nil
        end
      end
    end
  end
end
