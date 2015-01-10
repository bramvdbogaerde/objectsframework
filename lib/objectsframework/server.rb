module ObjectsFramework
  class Server
    attr_accessor :config

    def initialize(config = {})
      @config = {:index_method => "index"}.merge(config)
    end

    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new(env)
      # Solves some weird bug where ENV is added to the response body
      response.body = []
      response.length = 0
      # Set text/html as Content-type by default
      response.header["Content-type"] = "text/html"
      ObjectsFramework::ObjectHandler.run_methods(request,response,self);
      response.finish
    end

  end
end
