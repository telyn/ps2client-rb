require "ps2/client/version"

module Ps2
  module Client
    class Error < StandardError; end

    # TODO: move this once I get a PS2 LIRC client module/class written
    POWERON_REPEATS = 10
    RESET_REPEATS = 10
    SHUTDOWN_REPEATS = 50
  end
end
