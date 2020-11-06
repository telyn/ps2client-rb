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
          serialized_argv = argv.map(&:to_s).pack("Z*" * argv.count)

          # \x1str1\0 followed by 251 (256 - "str1\0".length) NULs
          [argv.length, serialized_argv].pack("Na#{width}")
        end

        def serialize_time(time)
          parts = Array(8)
          parts[7] = 0
          parts[6] = time.year - 1900
          parts[5] = time.month
          parts[4] = time.mday
          parts[3] = time.hour
          parts[2] = time.min
          parts[1] = time.sec
          parts[0] = 0
          parts.pack("C8")
        end

        def deserialize_time(bytes)
          ints = bytes.unpack("C8")
          Time.new(1900 + ints[6], ints[5], ints[4], ints[3], ints[2], ints[1])
        end
      end
    end
  end
end
