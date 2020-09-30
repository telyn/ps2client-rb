module PS2
  module Client
    class Packet
      # rubocop:disable Layout/HashAlignment
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

        open:           0xbabe0111,
        open_reply:     0xbabe0112,
        close:          0xbabe0121,
        close_reply:    0xbabe0122,
        read:           0xbabe0131,
        read_reply:     0xbabe0132,
        write:          0xbabe0141,
        write_reply:    0xbabe0142,
        lseek:          0xbabe0151,
        lseek_reply:    0xbabe0152,
        opendir:        0xbabe0161,
        opendir_reply:  0xbabe0162,
        closedir:       0xbabe0171,
        closedir_reply: 0xbabe0172,
        readdir:        0xbabe0181,
        readdir_reply:  0xbabe0182,
        rm:             0xbabe0191,
        rm_reply:       0xbabe0192,
        mkdir:          0xbabe01a1,
        mkdir_reply:    0xbabe01a2,
        rmdir:          0xbabe01b1,
        rmdir_reply:    0xbabe01b2,
        stat:           0xbabe01c1,
        stat_reply:     0xbabe01c2,
      }.freeze
      # rubocop:enable Layout/HashAlignment

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
