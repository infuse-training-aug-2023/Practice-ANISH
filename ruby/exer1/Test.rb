require 'test/unit'
require_relative 'exer'

class TestAvg < Test::Unit::TestCase
    def test_create_average
        created_book = Average.new("002-10.00-15.00")
        assert created_book.instance_of? Average
    end

    def test_parse_data
        avg = Average.new("002-10.00-12.00")
        avg.parse()
        assert_equal([2,10.0,12.0], avg.getStr)
    end
    
    def test_output_function
        avg = Average.new("002-10.00-12.00")
        assert_equal("002-11.00",avg.ouput())
    end
end