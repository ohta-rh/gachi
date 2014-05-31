module GachiRecord
  ##
  # = result class
  #   [Usage]
  #   ```
  #     user = User.find 1
  #     user.id
  #     => 1
  #   ```
  class Result

    module Behavior
      def method_missing(method, *args)
        if self.has_key?(method.to_sym)
          self[method.to_sym]
        else
          super
        end
      end
    end
  end
end
