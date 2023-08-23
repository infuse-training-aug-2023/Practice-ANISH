require "test/unit"
require_relative "exer"

class TestDecoder < Test::Unit::TestCase
  def test_init
    encoder = Encode.new()
    assert encoder.is_a? Encode
  end

  def test_file_read
    encoder = Encode.new()
    assert_equal(encoder.fileread("./text.txt"), 1)
  end

  def test_file_write
    encoder = Encode.new()
    encoder.fileread("./text.txt")
    assert_equal(encoder.encode("Anish"), 1)
  end
end
