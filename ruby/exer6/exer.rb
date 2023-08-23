require "base64"

class Encode
  attr_reader :txt

  def fileread(path)
    begin
      file = File.open(path)
      if file != nil
        @txt = file.read
        file.close
        return 1
      end
      raise "Empty File"
    rescue => exception
      raise "File not Found"
    end
  end

  def encode(name)
    begin
      encoded = Base64.encode64("“the string that will be base encoded ”")
      output = @txt.gsub("[ “the string that will be base encoded ”]", encoded)
      file = File.open(name + ".txt", "w+")
      file.write(output)
      file.close
      return 1
    rescue => exception
      print "Error"
      raise "Error writing File"
    end
  end
end
