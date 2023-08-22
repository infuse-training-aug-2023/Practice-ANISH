require "test/unit"
require_relative "exerc"

class TestJsonEncoder < Test::Unit::TestCase
  def test_init
    data = Datachanger.new()
    assert data.is_a? Datachanger
  end

  def test_check_delete
    data = Datachanger.new()
    data.transform

    assert_equal(data.json.has_key?("name"), false)
    assert_equal(data.json.has_key?("first name"), true)
    assert_equal(data.json.has_key?("last name"), true)
  end

  def test_ckeck_file_created
    data = Datachanger.new()
    data.transform
    assert_equal(data.dumpFile, 1)
  end
end
