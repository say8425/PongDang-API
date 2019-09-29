class Degree
  def save(temperature, measured_time)
    measured_on = measured_time.to_i
    measured_at = measured_time.to_s
    $redis.with do |conn|
      conn.hmset("degree:#{measured_on}",
                   'temperature', temperature,
                   'measured_on', measured_on,
                   'measured_at', measured_at,
                   'created_at', Time.current.to_s)
      conn.sadd('degrees', measured_on)
    end
  end

  def self.latest
    degree = $redis.with do |conn|
      conn.sort('degrees',
                get: %w[degree:*->measured_at degree:*->temperature],
                by: 'degree:*->measured_on',
                limit: [0, 1],
                order: 'desc')[0]
    end
    raise "Degree model is blank. #{degree}" if degree.blank?

    { measured_at: degree[0],
      temperature: degree[1].to_f }
  end
end
