class Degree
  def initialize(temperature, measured_time = current_measured_time)
    @redis = Redis.new
    @temperature = temperature
    @measured_time = measured_time
  end

  def save
    measured_on = @measured_time.to_i
    measured_at = @measured_time.to_s
    @redis.hmset("degree:#{measured_on}",
                 'temperature', @temperature,
                 'measured_on', measured_on,
                 'measured_at', measured_at,
                 'created_at', Time.current.to_s)
    @redis.sadd('degrees', measured_on)
  end

  def self.latest
    Redis.new.sort('degrees',
                   get: %w(degree:*->measured_at degree:*->temperature),
                   by: 'degree:*->measured_on',
                   limit: [0, 1],
                   order: 'desc')[0]
  end

  private

  def current_measured_time
    Time.current.beginning_of_hour
  end
end
