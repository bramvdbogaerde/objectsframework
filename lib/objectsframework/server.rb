module ObjectsFramework
  class Server
    def initialize

    end

    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new(env)
      # Solves some weird bug where ENV is added to the response body
      response.body = []
      response.length = 0
      # Set text/html as Content-type by default
      response.header["Content-type"] = "text/html"
      ObjectsFramework::ObjectHandler.run_methods(request,response);
      response.finish
    end

  end
end
