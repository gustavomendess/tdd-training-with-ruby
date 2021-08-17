describe 'Matcher output' do
  it { expect { puts 'Gustavo' }.to output.to_stdout}
  it { expect { print 'Gustavo' }.to output('Gustavo').to_stdout}
  it { expect { puts 'Gustavo' }.to output(/Gustavo/).to_stdout}

  it { expect { warn 'Gustavo' }.to output.to_stderr}
  it { expect { warn 'Gustavo' }.to output("Gustavo\n").to_stderr}
  it { expect { warn 'Gustavo' }.to output(/Gustavo/).to_stderr}
end