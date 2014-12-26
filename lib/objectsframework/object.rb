module ObjectsFramework
  class Object
      def initialize(request,response)
        @request,@response = request,response
      end

      def request
        @request
      end

      def response
        @response
      end
  end
end
