describe DegreesController, type: :controller do
  it 'index returns a success response' do
    get '/degrees'
    expect(response.status).to eq 200
    pp response.body
  end
end
