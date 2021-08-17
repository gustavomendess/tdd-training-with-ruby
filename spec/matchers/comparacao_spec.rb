describe 'Matchers de comparação' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 3
    expect(5).to be >= 5
  end

  it '<' do
    expect(5).to be < 10
  end

  it '<=' do
    expect(5).to be <= 12
    expect(5).to be <= 5
  end

  it 'be between inclusive' do
    expect(5).to be_between(2, 7).inclusive
    expect(2).to be_between(2, 7).inclusive
    expect(3).to be_between(2, 7).inclusive
  end

  it 'be between exclusive' do
    expect(5).to be_between(2, 7).exclusive
    expect(4).to be_between(2, 7).exclusive
    expect(3).to be_between(2, 7).exclusive
  end

  it 'match' do
    expect('fulano@gmail.com').to match(/..@../)
  end

  it 'start_with' do
    expect('fulano@gmail.com').to start_with('fu')
    expect([1, 2, 3, 4]).to start_with(1)
  end

  it 'end_with' do
    expect('fulano@gmail.com').to end_with('.com')
    expect([100, 200, 5]).to end_with(5)
  end
end