module ObjectsFramework
	module HookHelper
		@@hooks = []

		def self.add_hook(hook)
			@@hooks << hook
		end
	end
end
