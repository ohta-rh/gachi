module GachiRecord
  ##
  # = inspired ActiveRecord::Base
  #  [Usage]
  #    ```
  #    class User < GachiRecord::Base
  #    end
  #    ```
  #   
  class Base
    include DynamicFinder
  end
end
