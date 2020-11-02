require "ps2/client/packets/execiop"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::ExecIOP do
  subject(:instance) { described_class.new(*argv) }
  let(:file_name) { fake_file }

  context "with no args" do
    let(:argv) { [file_name] }

    shared_examples_for "body" do
      it "has correct contents" do
        expect(subject[0..3].unpack1("N")).to eq 1
        expect(subject[4...(file_name.length + 4)]).to eq argv.first
        expect(subject[(file_name.length + 4)..-1].split("").all? { |x| x == "\0" }).to be true
      end

      it "is correct length" do
        expect(subject.length).to eq 260
      end
    end

    it_behaves_like "packet", 0xbabe0202
  end

  context "with four args" do
    let(:argv) { ["arg 1", "arg 2", "arg 3", "arg 4"] }

    shared_examples_for "body" do
      it "has correct contents" do
        expect(subject[0..3].unpack1("N")).to eq 4
        expect(subject[4...10]).to eq "arg 1\0"
        expect(subject[10...16]).to eq "arg 2\0"
        expect(subject[16...22]).to eq "arg 3\0"
        expect(subject[22...28]).to eq "arg 4\0"
        expect(subject[28..-1].split("").all? { |x| x == "\0" }).to be true
      end

      it "is correct length" do
        expect(subject.length).to eq 260
      end
    end

    it_behaves_like "packet", 0xbabe0202
  end
end
