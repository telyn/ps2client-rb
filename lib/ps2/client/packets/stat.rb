require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class Stat < Packet
        def initialize(pathname)
          @pathname = pathname
          super(:stat)
        end

        def body
          [pathname].pack("a#{Helper::MAX_PATH_LEN}")
        end

        attr_accessor :pathname
      end
    end
  end
end
