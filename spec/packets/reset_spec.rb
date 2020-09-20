require "ps2/client/packets/reset"

RSpec.describe PS2::Client::Packets::Reset do
  subject(:instance) { described_class.new }
  describe "#body" do
    subject { instance.body }

    it { is_expected.to be nil }
  end

  describe "#magic" do
    subject { instance.magic }

    it { is_expected.to eq 0xbabe0201 }
  end

  describe "#serialize" do
    subject { instance.serialize }

    it { is_expected.to eq "\xba\xbe\x02\x01\x00\x06".force_encoding("ASCII-8BIT") }
  end
end
