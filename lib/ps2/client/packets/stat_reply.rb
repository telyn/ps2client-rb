require "ps2/client/packet"
require "ps2/client/packets/helper"

module PS2
  module Client
    module Packets
      class StatReply < Packet
        include Helper

        OK = 0
        # mode param is a uint32 but only the lowest 6 bits are used:
        # 0x20: dir
        # 0x10: reg(?)
        # 0x08: lnk (win32 only?)
        # 0x04: read
        # 0x02: write
        # 0x01: execute
        #
        # ps2client seems to only report "other" permissions, instead of "group"
        # or "owner" to the ps2. I have no idea why :)
        #
        # @param [Integer] errno Error received from stat() syscall - 0 for OK
        # @param [Integer] mode file mode (0o700 == u+rwx for example)
        # @param [Integer] attr ?? - always seems to be 0
        # @param [Integer] size file size
        # @param [Time] ctime created time
        # @param [Time] atime accessed time
        # @param [Time] mtime modified time
        # @param [Integer] hisize always 0 in ps2client - ignoring it for now.
        # TODO: make mode an array of flags / type in its own right
        # TODO: dive into ps2link source to try to understand hisize
        def initialize(errno,
                       mode = nil,
                       attr = nil,
                       size = nil,
                       ctime = nil,
                       atime = nil,
                       mtime = nil,
                       hisize = 0)
          @errno = errno
          @mode = mode
          @attr = attr
          @size = size
          @ctime = ctime
          @atime = atime
          @mtime = mtime
          @hisize = hisize
          super(:stat_reply)
        end

        def body
          if errno == OK
            array_to_pack.pack("l>NNNA8A8A8N")
          else
            [errno, ""].pack("Na44")
          end
        end

        attr_reader :errno, :mode, :attr, :size, :ctime, :atime, :mtime, :hisize

        private

        def array_to_pack
          [errno,
           mode,
           attr,
           size,
           serialize_time(ctime),
           serialize_time(atime),
           serialize_time(mtime),
           hisize]
        end
      end
    end
  end
end
