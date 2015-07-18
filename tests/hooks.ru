require 'objectsframework'

# This is a demonstration of the hooks system
class App < ObjectsFramework::Object
	add_hook :filter => "object.before_execute", :method => "before_execute_method"

	def get_index
		response.write "<h1>#{@title}</h1>"
	end

	def get_profile(profile_id, page)
		response.write "Looking up profile with id #{profile_id} and page #{page}"
	end

	def before_execute_method
		response.write "Doing some random stuff like connecting to the database<br/>"
	end
end

run ObjectsFramework::Server.new({:root => "App"})
