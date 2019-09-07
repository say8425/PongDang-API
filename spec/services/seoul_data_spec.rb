require 'rspec'

describe SeoulData do
  subject(:seoul_data, &method(:described_class))

  describe '#han_river_degree' do
    subject(:han_river_degree) { seoul_data.han_river_degree }

    context 'when han_river_degree succeeds' do
      it 'get degree' do
        expect(han_river_degree).to have_key(:temperature)
      end

      it 'get measured_at' do
        expect(han_river_degree).to have_key(:measured_at)
      end
    end
  end
end
