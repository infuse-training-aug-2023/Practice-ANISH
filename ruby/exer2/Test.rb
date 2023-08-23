require 'test/unit'
require_relative 'exerc'


class TestArray <Test::Unit::TestCase
    # attr_reader :arrfn
    def test_init
        @arrfn = Arrayfunctions.new([9,5,1,2,3,4,0,-1])
        assert @arrfn.instance_of? Arrayfunctions
    end
    def test_index_at
        arrfn = Arrayfunctions.new([9,5,1,2,3,4,0,-1])
        assert_equal(arrfn.element_at(2),1,"Element At Assert")
    end

    def test_inclusive_range
        arrfn = Arrayfunctions.new([9,5,1,2,3,4,0,-1])
        assert_equal(arrfn.inclusive_range(2,4),[1,2,3],"Inclusive Range")
    end

    def test_non_inclusive_range
        arrfn = Arrayfunctions.new([9,5,1,2,3,4,0,-1])
        assert_equal(arrfn.non_inclusive_range(2,4),[1,2],"Non Inclusive Range")
    end

    def test_start_and_length
        arrfn = Arrayfunctions.new([9,5,1,2,3,4,0,-1])
        assert_equal(arrfn.start_and_length(3,2),[2,3,4],"Start and length")
    end
    # def test_inclusive_range

end