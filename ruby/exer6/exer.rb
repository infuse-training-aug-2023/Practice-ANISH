require "base64"

class Encode
  attr_reader :txt

  def fileread(path)
    file = File.open(path)
    @txt = file.read
    file.close
  end

  def encode(name)
    encoded = Base64.encode64("the string that will be base encoded.")

    file = File.open(name + ".txt", "w+")
    file.write(@txt + " " + encoded)
    file.close
  end
end
