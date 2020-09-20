module PS2
  module Client
    class Packet
      MAGIC = {
        reset:    0xbabe0201,
        execiop:  0xbabe0202,
        execee:   0xbabe0203,
        poweroff: 0xbabe0204,
        scrdump:  0xbabe0205,
        netdump:  0xbabe0206,
        dumpmem:  0xbabe0207,
        startvu:  0xbabe0208,
        stopvu:   0xbabe0209,
        dumpreg:  0xbabe020a,
        gsexec:   0xbabe020b,
        writemem: 0xbabe020c,
        iopexcep: 0xbabe020d,
      }.freeze

      class BadTypeError < StandardError; end
      def initialize(type)
        raise BadType, type unless MAGIC.key?(type)

        @type = type
      end

      def serialize
        body_s = body.to_s
        body_s = body_s.dup if body_s.frozen?
        body_s = body_s.force_encoding("ASCII-8BIT")
        [magic, 6 + body_s.length].pack("Nn") + body_s
      end

      attr_accessor :type

      def magic
        MAGIC[type]
      end
    end
  end
end
