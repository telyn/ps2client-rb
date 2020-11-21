module PS2
  module Client
    class PS2State
      STATES = %i[unknown off booting ps2link running exited].freeze

      include Observable

      def initialize
        @state = :unknown
      end

      def change!(new_state)
        raise ArgumentError, "#{new_state} is not an acceptable state" unless STATES.include?(new_state)
      end

      def to_s
        @state.to_s
      end

      STATES.each do |st|
        define_method(st) do
          @state.eql?(st)
        end
      end
    end
  end
end
