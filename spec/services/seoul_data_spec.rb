require 'rspec'

describe '#han_river_degree' do
  let(:seoul_data) { SeoulData.han_river_degree }

  context 'when succeeds' do
    it 'get degree and measured_at keys' do
      expect(seoul_data).to have_key(:degree)
      expect(seoul_data).to have_key(:measured_at)
    end
  end
end
