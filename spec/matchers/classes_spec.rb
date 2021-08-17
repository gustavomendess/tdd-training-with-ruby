describe 'Classes' do
  it 'be_instance_of (exatamente a classe)' do
    expect(5).to be_instance_of(Integer)
  end

  it 'be_kind_of (funciona com herança)' do
    expect(10).to be_kind_of(Integer)
  end

  it 'be_a / be_an, (be_kind_of mais enxuto)' do
    expect('ruby').to be_a(String)

    expect('ruby').to be_an(String)
  end

  it 'respond_to' do
    expect('ruby').to respond_to(:count)
    expect('ruby').to respond_to(:size)
  end
end