class Skip
  def initialize(arr)
    @arr = arr
  end

  def skip_sports(number)
    @arr = @arr[number..]
    i = 0
    print @arr.map.with_index { |x, i|
      "%d%s" % [number + i, x]
    }
    # print @arr
  end
end

# skip = Skip.new(["arr", "Football", "cricket", "asas"])
# skip.skip_sports(2)
