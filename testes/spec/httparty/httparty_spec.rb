describe 'HTTParty' do
  it 'HTTParty' do
    stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: "", headers: { 'content-type': 'application/json' })

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')

    expect(response.headers['content-type']).to match(/application\/json/)
  end

  it 'HTTParty com VCR', vcr: { cassette_name: 'jsonplaceholder/post' } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')

    expect(response.headers['content-type']).to match(/application\/json/)
  end

  # Utilizando match_requests_on, ele valida apenas de o body da requisição é igual, removendo alguns fatores que em
  # alguns momentos não interessam no teste
  it 'HTTParty com VCR', vcr: { cassette_name: 'jsonplaceholder/post2', match_requests_on: [:body]  } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')

    expect(response.headers['content-type']).to match(/application\/json/)
  end

  # Utilizando record modes diferentes, para evitar erro de requisições
  it 'HTTParty com VCR', vcr: { cassette_name: 'jsonplaceholder/posts', record: :new_episodes  } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/10')

    expect(response.headers['content-type']).to match(/application\/json/)
  end
end