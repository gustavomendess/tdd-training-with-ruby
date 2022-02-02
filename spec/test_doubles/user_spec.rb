describe 'Test Double' do
  it '--' do
    user = double('User')
    allow(user).to receive_messages(name: 'Gustavo', password: 'secret')
    puts user.name
    puts user.password
  end

  it '--' do
    user = double('User').as_null_object
    allow(user).to receive(:name).and_return('Gustavo')
    allow(user).to receive(:password).and_return('Secret')
    puts user.name
    puts user.password
    user.abc
  end
end