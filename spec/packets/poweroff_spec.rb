require "ps2/client/packets/poweroff"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::PowerOff do
  subject(:instance) { described_class.new }
  it_behaves_like "packet", 0xbabe0204, empty_body: true
end
