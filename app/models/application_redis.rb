class ApplicationRedis
  def initialize
    @redis = Redis.new(host: ENV['REDIS_HOST'],
                       port: ENV['REDIS_PORT'],
                       db: ENV['REDIS_DB'],
                       password: ENV['REDIS_PSWD'])
  end
end
