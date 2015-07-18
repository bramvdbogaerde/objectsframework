module ObjectsFramework
	class Hooks
		def self.fire(filter, klass)
			hooks_to_execute = klass.class.get_hooks.select { |hook| hook[:filter] == filter }
			hooks_to_execute.each do |hook|
				klass.send(hook[:method].to_sym)
			end
		end
	end
end
