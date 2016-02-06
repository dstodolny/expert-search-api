# Patches for Rails 5 and decent exposure
module DecentExposure
  module Expose
    def hide_action(action)
    end

    def helper_method(*meths)
    end

    def protected_instance_variables
      []
    end
  end
end
