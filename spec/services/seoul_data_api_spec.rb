require 'rspec'

describe SeoulDataApi do
  subject(:seoul_data_api) { SeoulDataApi.new }

  describe '#latest' do
    before { seoul_data_api.measure }

    context 'when han_river_degree succeeds' do
      it 'get temperature' do
        expect(seoul_data_api.temperature).not_to be_nil
      end

      it 'get measured_at' do
        expect(seoul_data_api.measured_at).not_to be_nil
      end
    end
  end
end
