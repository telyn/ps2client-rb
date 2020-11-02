require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class ReadReply < Packet
        # flags is expected to be an integer as would be passed to open(2) or
        # fcntl(2). See the Fcntl standard library documentation.
        def initialize(result, size)
          @result = result
          @size = size
          super(:read_reply)
        end

        def body
          [result, size].pack("l>l>")
        end

        attr_accessor :result, :size
      end
    end
  end
end
