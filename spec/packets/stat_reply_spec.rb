# frozen_string_literal: true

require "ps2/client/packets/stat_reply"
require "ps2/client/packets/helper"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::StatReply do
  include PS2::Client::Packets::Helper

  subject(:instance) { described_class.new(errno, mode, attr, size, ctime, atime, mtime, hisize) }

  let(:errno) { 0 }
  let(:mode) { fake_uint32 }
  let(:attr) { fake_uint32 }
  let(:size) { fake_uint32 }
  let(:ctime) { fake_time }
  let(:atime) { fake_time }
  let(:mtime) { fake_time }
  let(:hisize) { fake_uint32 }

  describe "successful reply" do
    let(:errno) { 0 }

    shared_examples_for "body" do
      it "has correct contents" do
        expect(subject[0...4].unpack1("N")).to eq errno
        expect(subject[4...8].unpack1("N")).to eq mode
        expect(subject[8...12].unpack1("N")).to eq attr
        expect(subject[12...16].unpack1("N")).to eq size
        expect(deserialize_time(subject[16...24])).to eq ctime
        expect(deserialize_time(subject[24...32])).to eq atime
        expect(deserialize_time(subject[32...40])).to eq mtime
        expect(subject[40...44].unpack1("N")).to eq hisize
      end
    end

    it_behaves_like "packet", 0xbabe01c2, length: 4 + 4 + 4 + 4 + 8 + 8 + 8 + 4
  end

  describe "failure reply" do
    let(:errno) { 1 }

    shared_examples_for "body" do
      it "has correct contents" do
        expect(subject[0...4].unpack1("N")).to eq 1
        expect(subject[4...48].split("").all? { |x| x == "\0" }).to be true
      end
    end

    it_behaves_like "packet", 0xbabe01c2, length: 48
  end
end
