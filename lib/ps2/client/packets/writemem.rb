require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class WriteMem < Packet
        def initialize(offset, size, pathname)
          @offset = offset
          @size = size
          @pathname = pathname
          super(:writemem)
        end

        def body
          [offset, size, pathname].pack("NNa#{Helper::MAX_PATH_LEN}")
        end

        attr_reader :offset, :size, :pathname
      end
    end
  end
end
