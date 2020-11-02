require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      module NetFS
        class Close < Packet
          def initialize(fd)
            @fd = fd
            super(:netfs_close)
          end

          def body
            [fd].pack("N")
          end


          attr_accessor :fd
        end
      end
    end
  end
end
