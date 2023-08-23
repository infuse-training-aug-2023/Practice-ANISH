class Skip
  def initialize(arr)
    @arr = arr
  end

  def skip_sports(number)
    if (number > 0 and number < @arr.length)
      temp = []

      @arr.each_with_index { |ele, index|
        if index >= number
          temp.append(index.to_s + ele)
        end
      }

      return temp
    end

    return []
  end
end

# skip = Skip.new(["arr", "Football", "cricket", "asas"])
# skip.skip_sports(2)
