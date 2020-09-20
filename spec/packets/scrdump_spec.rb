require "ps2/client/packets/scrdump"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::ScrDump do
  subject(:instance) { described_class.new }

  it_behaves_like "packet", 0xbabe0205, empty_body: true
end
