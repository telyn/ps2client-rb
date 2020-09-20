require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class GSExec < Packet
        def initialize(size, pathname)
          @size = size
          @pathname = pathname
          super(:gsexec)
        end

        def body
          [size, pathname].pack("Na#{Helper::MAX_PATH_LEN}")
        end

        attr_reader :size, :pathname
      end
    end
  end
end
