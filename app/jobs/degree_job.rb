class DegreeJob < ApplicationJob
  rate '1 hour'

  def store
    seoul_data_api = SeoulDataApi.new

    # TODO alert error message with telegram
    return unless seoul_data_api.measure

    degree = Degree.new
    degree.save(seoul_data_api.temperature, seoul_data_api.measured_at)
  end
end
