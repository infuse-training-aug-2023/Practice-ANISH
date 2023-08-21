class Arrayfunctions
    attr_reader :arr
    def initialize(array)
        @arr = array
    end

    def element_at(index)
        if @arr.length() > index
            return @arr[index]
        else
            return -1
        end    
    end 

    def inclusive_range(start_pos,end_pos)
        if(start_pos >0 and end_pos < @arr.length())
            return @arr[start_pos..end_pos]
        
        else
            return []
        end
    end
    def non_inclusive_range(start_pos,end_pos)
        if(start_pos >0 and end_pos < @arr.length())
            return @arr[start_pos...end_pos]
        
        else
            return []
        end
    end
    def start_and_length(start_pos,length)
        if(start_pos >0 and start_pos+length < @arr.length)
            return @arr[start_pos..start_pos+length]
        else
            return -1
        end
    end
end

# a = Arrayfunctions.new([9,5,1,2,3,4,0,-1])

# puts a.element_at(2)
# print a.inclusive_range(2,4)
# puts ""
# print a.non_inclusive_range(2,4)

# puts ""

# print a.start_and_length(3,2)

