require 'http'

class SeoulData
  def self.han_river_degree
    uri = "http://openapi.seoul.go.kr:8088/#{ENV['SEOUL_DATA_KEY']}/json/WPOSInformationTime/1/5".freeze
    response = HTTP.get(uri)
    response_body = response.parse['WPOSInformationTime']['row']
    data = response_body.find { |key| key['SITE_ID'] == '노량진' }

    # TODO: alert by telegram
    raise 'Getting data is failed!' if data.blank?

    { temperature: data['W_TEMP'].to_f,
      measured_at: Time.parse("#{data['MSR_DATE']} #{data['MSR_TIME']} +09:00") }
  end
end
