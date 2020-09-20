require "ps2/client/packets/dumpreg"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::DumpReg do
  subject(:instance) { described_class.new(type, pathname) }
  let(:type) { 0x0205 }
  let(:pathname) { "test.rom" }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq 0x205
      expect(subject[4..11]).to eq "test.rom"
      expect(subject[12..-1].split("").all? { |x| x == "\0" }).to be true
    end

    it "has correct length" do
      expect(subject.length).to eq 4 + 256
    end
  end

  it_behaves_like "packet", 0xbabe020a
end
