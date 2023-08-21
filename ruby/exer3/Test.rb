require 'test/unit'
require_relative 'exerc'


class TestArray <Test::Unit::TestCase
    def test_check_initialize
        hmap = HashT.new()
        assert hmap.is_a? HashT
    end

    def test_adding
        hmap = HashT.new()
        hmap.add(10,16)
        assert_equal(hmap.hash.length,1)
    end

    def test_delete_string
        hmap = HashT.new()
        hmap.add("12",9)
        hmap.add("123",9)
        hmap.add(123,9)
        hmap.add(1234,9)

        hmap.delete_keys_non_int
        
        hmap.hash.each_key { |key| assert key.is_a? Integer }
    end

    def test_delete_odd
        hmap = HashT.new()
        hmap.add(10,16)
        hmap.delete_keys_odd_int
        hmap.hash.each_key { |key| assert_equal(key % 2,0,"Odd") }
    end
end