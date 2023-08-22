require "time"
require "json"

class Datachanger
  attr_reader :json
  attr_reader :path

  def transform
    file = File.open("./data.json")
    @json = JSON.parse(file.read)
    file.close
    @json["first name"], @json["last name"] = @json["name"].split(" ")
    @json.delete("name")
  end

  def dumpFile
    begin
      dump = JSON.dump(@json)
      @time = Time.new.utc.to_i
      f = File.new(("./ANISH_%s.json" % @time), "w+")
      f.syswrite dump
      f.close
      return 1
    rescue => exception
      return -1
    end
  end
end

d = Datachanger.new()

d.transform
d.dumpFile
