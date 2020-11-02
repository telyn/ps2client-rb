require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class Read < Packet
        # flags is expected to be an integer as would be passed to open(2) or
        # fcntl(2). See the Fcntl standard library documentation.
        def initialize(fd, size)
          @fd = fd
          @size = size
          super(:read)
        end

        def body
          [fd, size].pack("NN")
        end

        attr_accessor :fd, :size
      end
    end
  end
end
