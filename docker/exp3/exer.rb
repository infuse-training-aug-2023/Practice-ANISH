class Average
  attr_reader :input_str

  def initialize(inp)
    @input_str = inp
  end

  def parse()
    @input_str = @input_str.split("-")
    if @input_str.length() > 3 or @input_str.length() < 2
      raise "Invalid Input"
    end
    @input_str[0] = @input_str[0].to_i
    average = (@input_str[1].to_f + @input_str[2].to_f) / 2

    outputStr = @input_str[0].to_s.rjust(3, "0") + "-#{"%.2f" % average}"
    return outputStr.to_s
  end
end

# obj = Average.new(data_inpu)
# puts obj.ouput()
