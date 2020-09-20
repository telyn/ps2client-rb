require "ps2/client/packets/iopexcep"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::IOPExcep do
  subject(:instance) { described_class.new }

  it_behaves_like "packet", 0xbabe020d, empty_body: true
end
