require "faker"
module FakerHelper
  def fake_file
    Faker::File.file_name(dir: "")[1..-1]
  end

  def fake_int32
    fake_int(32)
  end

  def fake_int8
    fake_int(8)
  end

  def fake_uint8
    fake_uint(8)
  end

  def fake_int(bit_depth)
    bd = bit_depth - 1
    Faker::Number.between(from: -(2**bd), to: (2**bd) - 1)
  end

  def fake_uint(bit_depth)
    Faker::Number.between(from: 0, to: (2**bit_depth) - 1)
  end
end
