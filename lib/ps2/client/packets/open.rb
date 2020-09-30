require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class Open < Packet
        # flags is expected to be an integer as would be passed to open(2) or
        # fcntl(2). See the Fcntl standard library documentation.
        def initialize(pathname, flags)
          @pathname = pathname
          @flags = flags
          super(:open)
        end

        def body
          [flags, pathname].pack("Na#{Helper::MAX_PATH_LEN}")
        end

        attr_accessor :flags, :pathname
      end
    end
  end
end
