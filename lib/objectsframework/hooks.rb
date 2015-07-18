module ObjectsFramework
	class Hooks
		def self.fire(filter, klass)
			hooks_to_execute = klass.class.get_hooks.select { |hook| hook[:filter] == filter }
			hooks_to_execute.each do |hook|
				result = klass.send(hook[:method].to_sym)
				return result unless result == 0
			end
			return 0
		end

		def self.hook_exists?(filter,klass)
			!(klass.class.get_hooks.select{|hook| hook[:filter] == filter}).empty?
		end

		def self.continue
      return 0
    end

	end
end
