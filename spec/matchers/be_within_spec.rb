describe 'be_within' do
  it {expect(12.4).to be_within(0.6).of(12)}
  it {expect([12.6, 12.8, 12.4]).to all( be_within(0.9).of(12))}
end