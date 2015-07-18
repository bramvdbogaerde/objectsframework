module ObjectsFramework
  class Object
      def set_instance_variables(request,response)
        @request,@response = request,response
        return self;
      end

      def request
        @request
      end

      def response
        @response
      end

      def continue
        return 0
      end

      # Object hooks:
      # Usage: add_hook :filter => "afilter", :method => "yourmethod"
      # Available hooks/filters (some are not implement yet, but planned):
      # * object.before_execute: fired before your request handling method is called
      # * request.finished: fired when the request is finished and the response is about to get served [planned]
      # * server.ready: fired when the server is ready accepting connections [planned]
      # * server.error: fired when an internal error happens (for example method not found) [planned]
      # * request.capture: capture the request before anything happens, like a real pirate! (fired after your object is created)
      #                    if the result of your hook returns true, the request must be finished by your hook
      #                    this can block the request
      # All hooks are blocking, so they could eventually block the request [Future testing required]
      @@hooks = []

  		def self.get_hooks
  			@@hooks
  		end

  		def self.add_hook(hook)
  			@@hooks << hook
  		end
  end
end
