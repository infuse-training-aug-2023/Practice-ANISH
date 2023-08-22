class Skip
  def initialize(arr)
    @arr = arr
  end

  def skip_sports(number)
    if (number > 0 and number < @arr.length)
      temp = @arr[number..]
      i = 0
      print temp.map.with_index { |x, i|
        "%d%s" % [number + i, x]
      }
      return 1
    end

    return -1
    # print @arr
  end
end

# skip = Skip.new(["arr", "Football", "cricket", "asas"])
# skip.skip_sports(2)
