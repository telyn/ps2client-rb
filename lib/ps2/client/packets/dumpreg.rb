require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class DumpReg < Packet
        def initialize(register_type, pathname)
          @register_type = register_type
          @pathname = pathname
          super(:dumpreg)
        end

        def body
          [register_type, pathname].pack("Na#{Helper::MAX_PATH_LEN}")
        end

        attr_reader :register_type, :pathname
      end
    end
  end
end
