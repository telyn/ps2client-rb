require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      module NetFS
        class Read < Packet
          def initialize(fd, size)
            @fd = fd
            @size = size
            super(:netfs_read)
          end

          def body
            [fd, size].pack("NN")
          end


          attr_accessor :fd, :size
        end
      end
    end
  end
end
