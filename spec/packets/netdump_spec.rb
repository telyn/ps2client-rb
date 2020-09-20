require "ps2/client/packets/netdump"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::NetDump do
  subject(:instance) { described_class.new }

  it_behaves_like "packet", 0xbabe0206, empty_body: true
end
