require 'objectsframework'

# This is a demonstration of the hooks system
class App < ObjectsFramework::Object
	add_hook :filter => "request.capture", :method => "check_login"
	add_hook :filter => "object.before_execute", :method => "before_execute_method"

	def get_index
		response.write "<h1>Hello World</h1>"
	end

	def get_profile(profile_id, page)
		response.write "Looking up profile with id #{profile_id} and page #{page}"
	end

	# This can't block the request
	# Define as many as you like of this type of hook
	def before_execute_method
		response.write "Doing some random stuff like connecting to the database<br/>"
	end

	# This can block the request
	# Future hooks are not executed if this doesn't return 0 (or continue)
  # Example of a login system
	def check_login
		if(request.params["password"] == "x")
			continue
		else
			response.write "Invalid access"
			response.finish
		end
	end
end

run ObjectsFramework::Server.new({:root => "App"})
