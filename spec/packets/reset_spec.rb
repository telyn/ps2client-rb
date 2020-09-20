require "ps2/client/packets/reset"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::Reset do
  subject(:instance) { described_class.new }

  it_behaves_like "packet", 0xbabe0201, empty_body: true
end
