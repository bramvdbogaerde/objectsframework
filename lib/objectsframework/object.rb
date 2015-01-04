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
  end
end
