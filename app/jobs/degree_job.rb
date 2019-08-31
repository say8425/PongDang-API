class DegreeJob < ApplicationJob
  rate '1 hour'

  def store
    seoul_data = SeoulData.han_river_degree
    degree = Degree.new(seoul_data[:temperature], seoul_data[:measured_at])
    degree.save
  end
end
