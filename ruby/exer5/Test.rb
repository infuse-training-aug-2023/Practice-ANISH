require "test/unit"
require_relative "exerc"

class TestJsonEncoder < Test::Unit::TestCase
  def test_init
    data = JsonExample.new()
    assert data.is_a? JsonExample
  end

  def test_check_delete
    data = JsonExample.new()
    data.transform_file

    assert_equal(data.json.has_key?("name"), false)
    assert_equal(data.json.has_key?("first name"), true)
    assert_equal(data.json.has_key?("last name"), true)
  end

  def test_ckeck_file_created
    data = JsonExample.new()
    data.transform_file
    assert_equal(data.write_file, 1)
  end
end
