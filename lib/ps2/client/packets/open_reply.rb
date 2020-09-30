require "ps2/client/packet"
require "ps2/client/packets/simple_reply"

module PS2
  module Client
    module Packets
      class OpenReply < SimpleReply
        # result is an integer - the return code from a call to open(2)
        def initialize(result)
          @result = result
          super(:open_reply, result)
        end
      end
    end
  end
end
