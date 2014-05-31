module GachiRecord
  module DynamicFinder

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      #
      # === find by natural key
      #  - id integer
      #    [Usage]
      #       ```
      #        user = User.find(1)
      #       ```
      def find(id)
        raise ArgumentError unless id
        res = find_by(id: id)
      end

      #
      # === finb by any conditions
      # - conditons Hash
      #   [Usage]
      #   ```ruby
      #     user = User.find_by(id: 1, name: 2)
      #     * select * from users where id = 1 and name = '2'
      #
      #   ```
      #
      def find_by(conditions={})
        raise ArgumentError if conditions.empty?
        query = %(SELECT * FROM #{table_name} #{build_condition(conditions)})
        res = connection.execute(query).first

        if res.nil?
          raise RecordNotFound
        end
        res.extend Result::Behavior
      end

      def build_condition(conditions={})
        cond = [].tap do |cond|
                    conditions.each do |k,v|
                      cond << "#{k} = '%s'"
                    end
                  end.join(" AND ")
        %( WHERE #{cond}) % conditions.values
      end

      protected

      def connection
        @connection ||= Connection.instance
      end

      def table_name
        @table_name ||= self.to_s.downcase + "s"
      end
    end
  end
end
