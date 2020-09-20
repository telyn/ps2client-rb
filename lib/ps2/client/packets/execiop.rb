require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class ExecIOP < Packet
        include Helper

        def initialize(*argv)
          @argv = argv
          super(:execiop)
        end

        def body
          serialize_argv(argv)
        end

        attr_reader :argv
      end
    end
  end
end
