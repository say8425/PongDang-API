require 'httparty'

class SeoulData
  include HTTParty
  base_uri "http://openapi.seoul.go.kr:8088/#{ENV['SEOUL_DATA_KEY']}/json"

  def self.han_river_degree
    response = get('/WPOSInformationTime/1/5')
    response_body = JSON.parse(response.body)['WPOSInformationTime']['row']
    data = response_body.find { |key| key['SITE_ID'] == '노량진' }

    { degree: data['W_TEMP'].to_f,
      measured_at: Time.parse("#{data['MSR_DATE']} #{data['MSR_TIME']} +09:00") }
  end
end
