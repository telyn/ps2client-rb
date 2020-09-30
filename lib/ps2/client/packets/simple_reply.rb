require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      # base class for implementing single-value int32 return calls
      class SimpleReply < Packet
        # result is an integer - the return code from a call to open(2)
        def initialize(type, result)
          @result = result
          super(type)
        end

        def body
          [result].pack("N")
        end

        attr_reader :result
      end
    end
  end
end
