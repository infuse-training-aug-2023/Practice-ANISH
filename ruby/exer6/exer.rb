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
      return -1
    rescue => exception
      return -1
    end
  end

  def encode(name)
    begin
      encoded = Base64.encode64("the string that will be base encoded.")

      file = File.open(name + ".txt", "w+")
      file.write(@txt + " " + encoded)
      file.close
      return 1
    rescue => exception
      return -1
    end
  end
end
