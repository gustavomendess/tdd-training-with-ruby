describe (1..5), 'Ranges' do
  it '#cover' do
    expect(subject).to cover(2, 3)
    expect(subject).to cover(5, 4)
    expect(subject).not_to cover(0, 6)
  end

  it { is_expected.to cover(2) }
  it { is_expected.to cover(2, 5) }
  it { is_expected.not_to cover(78, 10) }
  it { expect(subject).not_to cover(13, 11) }
end