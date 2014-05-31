module GachiRecord
  ##
  # = Database connection manager
  class Connection
    include Singleton

    def initialize
      #TODO: 後でyml
      #@config = YAML.load_file("../../config/database.yml")
      @config = {
        host: "localhost",
        username: "root",
        database: "gachi"
      }
    end

    #
    # == Proxy mysql2::client
    #
    def execute(query)
      mysql2.query(query)
    end

    #
    # == connection pooling mysql2 client
    #
    def mysql2
      @mysql2 ||= Mysql2::Client.new(@config)
    end
  end
end
