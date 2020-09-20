require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class ExecEE < Packet
        include Helper

        def initialize(*argv)
          @argv = argv
          super(:execee)
        end

        def body
          serialize_argv(argv)
        end

        attr_reader :argv
      end
    end
  end
end
