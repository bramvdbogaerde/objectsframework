module ObjectsFramework
  class ObjectHandler
    # DEPRACTED: do not override the ObjectHandler class anymore use object hooks
    # This event will never be used again
    def self.finished(klass,request,response,context)
      # Nothing
    end

    def self.run_methods(request,response,context)
      path = request.path
      parts = path.split("/")
      if(path == "/" && !context.config[:root].nil?)
        klass = Object.const_get(context.config[:root]).new

        captured_result = captured?(klass)
        if(captured_result != 0)
          return captured_result
        end

        Hooks.fire("object.before_execute", klass)

        klass.set_instance_variables(request,response,context.env).send(request.request_method.downcase!+"_"+context.config[:index_method])
        return true
      end

      begin
        klass = Object.const_get(parts[1].capitalize).new.set_instance_variables(request,response,context.env)

        captured_result = captured?(klass)
        if(captured_result != 0)
          return captured_result
        end

        Hooks.fire("object.before_execute", klass)

        if(parts[3].nil?)
          if(path[path.length-1] == "/" || parts.length == 2)
            klass.send(request.request_method.downcase!+"_index");
          else
            klass.send(request.request_method.downcase!+"_"+parts[2])
          end
        else
          klass.send(request.request_method.downcase!+"_"+parts[2],*parts[3..parts.length])
        end
      rescue Exception => e
        begin
          obj = Object.const_get(context.config[:root]).new.set_instance_variables(request,response,context.env)

          captured_result = captured?(obj)
          if(captured_result != 0)
            return captured_result
          end

          Hooks.fire("object.before_execute", obj)
          obj.send(request.request_method.downcase!+"_"+parts[1])
          return true
        rescue

        end
        response.status =  404
        notfound_response(response,e)
      end
      return true
    end

    def self.notfound_response(response,e)
      response.write "<h1>404 Not Found</h1><hr/><i>Ruby Rack Server powered by ObjectsFramework <br/><pre>#{e.to_s}</pre></i>"
    end

    def self.captured?(klass)
      if(Hooks.hook_exists?("request.capture",klass))
          result = Hooks.fire("request.capture",klass)
          if(result != 0)
            return result
          end
          return 0
      end
      return 0
    end
  end
end
