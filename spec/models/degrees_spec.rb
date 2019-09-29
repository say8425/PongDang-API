require 'rspec'

describe Degree do
  describe '#latest' do
    let(:latest_time) { Time.new(2025, 11, 3, 7, 8, 16, '+09:00') }
    let(:latest_temp) { 20.2 }

    before do
      Degree.new.save(25.1, Time.new(2023, 5, 5, 12, 42, 38, '+09:00'))
      Degree.new.save(20.2, Time.new(2020, 9, 22, 11, 20, 2, '+09:00'))
      Degree.new.save(latest_temp, latest_time)
      Degree.new.save(20.2, Time.new(2019, 1, 2, 7, 1, 37, '+09:00'))
    end

    after(:all) do
      $redis.shutdown do |conn|
        conn.flushdb
        conn.quit
      end
    end

    context 'when many degrees stored' do
      it 'get latest ones measured_at key' do
        expect(Degree.latest).to have_key(:measured_at)
      end

      it 'get latest ones measured_at value' do
        expect(Degree.latest[:measured_at]).to eql(latest_time.to_s)
      end

      it 'get latest ones temperature key' do
        expect(Degree.latest).to have_key(:temperature)
      end

      it 'get latest ones temperature value' do
        expect(Degree.latest[:temperature]).to eql(latest_temp)
      end
    end
  end
end
