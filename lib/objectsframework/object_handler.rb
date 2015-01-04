module ObjectsFramework
  class ObjectHandler
    def self.run_methods(request,response)
      path = request.path
      parts = path.split("/")
      begin
        klass = Object.const_get(parts[1].capitalize).new.set_instance_variables(request,response)
        if(parts[3].nil?)
          if(path[path.length-1] == "/")
            klass.send(request.request_method.downcase!+"_index");
          else
            klass.send(request.request_method.downcase!+"_"+parts[2])
          end
        else
          klass.send(request.request_method.downcase!+"_"+parts[2],parts[3..parts.length])
        end
      rescue Exception => e
        response.status =  404
        response.write "<h1>404 Not Found</h1><hr/><i>Ruby Rack Server powered by ObjectsFramework <br/><pre>#{e.to_s}</pre></i>"
      end

    end
  end
end
