module PS2
  module Client
    module Packets
      module Helper
        MAX_PATH_LEN = 256

        def serialize_strings(strings)
          [strings.length, strings.map(&:to_s)].flatten.pack("nZ*")
        end

        # due to the way ps2link de-serializes packets, we have to transmit
        # packets of exactly the right length - this helps us do that.
        def serialize_argv(argv, width = MAX_PATH_LEN)
          serialized_argv = argv.map(&:to_s).pack("Z*")

          # \x1str1\0 followed by 251 (256 - "str1\0".length) NULs
          [argv.length, serialized_argv].pack("Na#{width}")
        end
      end
    end
  end
end
