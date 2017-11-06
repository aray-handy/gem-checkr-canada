module CheckrCanada
  def self.configure
    yield config
  end

  def self.config
    @config ||= Configuration.new
  end

  class Configuration
    attr_accessor :apikey

    def client
      CheckrCanada::Client.new(apikey)
    end
  end
end
