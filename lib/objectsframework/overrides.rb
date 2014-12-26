# I do this in order to have access to Ruby's File class instead of Rack::File
$file = File
module Rack
  class Response
    # Send file
    def send(filename)
      self.write $file.read(filename);
    end
  end
end
