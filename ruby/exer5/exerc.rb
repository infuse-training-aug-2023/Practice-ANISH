require "time"
require "json"

class JsonExample
  attr_reader :json
  attr_reader :path

  def transform_file
    file = File.open("./data.json")
    @json = JSON.parse(file.read)
    file.close
    @json["first name"], @json["last name"] = @json["name"].split(" ")
    @json.delete("name")
  end

  def write_file
    begin
      dump = JSON.dump(@json)
      @time = Time.new.utc.strftime("%Y-%m-%d%H.%M.%S%z")

      f = File.new(("./ANISH_%s.json" % @time), "w+")
      f.syswrite dump
      f.close
      return 1
    rescue => exception
      print exception
      return -1
    end
  end
end

# d = DataChanger.new()

# d.transform
# d.write_file
