class ServiceBase
  def initialize(*args); end

  def self.call(*args, **params)
    new(*args, **params).call
  end
end
