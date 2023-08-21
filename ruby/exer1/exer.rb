data_inpu = gets.chomp


class Average
    
    def initialize(inp)
        @str = inp
    end

    def parse()
        @str = @str.split("-")
        @str = @str.map{|ele| ele.to_f}
        @str[0] = @str[0].to_i
    end
    def getStr
        @str
    end
    def ouput()
        parse()
        outputStr = @str[0].to_s.rjust(3, "0")+ "-#{"%.2f" % ((@str[1] + @str[2])/ 2)}"

        return outputStr
    end
end
# obj = Average.new(data_inpu)
# puts obj.ouput()
