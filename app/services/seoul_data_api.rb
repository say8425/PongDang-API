require 'http'

class SeoulDataApi
  attr_reader :temperature, :measured_at

  def latest
    data = response.parse['WPOSInformationTime']['row']
                   .find { |key| key['SITE_ID'] == '노량진' }
    if data.blank?
      false
    else
      @temperature = data['W_TEMP'].to_f
      @measured_at = Time.parse("#{data['MSR_DATE']} #{data['MSR_TIME']} +09:00")
      true
    end
  end

  private

  def response
    @response ||= HTTP.get("http://openapi.seoul.go.kr:8088/#{ENV['SEOUL_DATA_KEY']}/json/WPOSInformationTime/1/5")
  end
end
