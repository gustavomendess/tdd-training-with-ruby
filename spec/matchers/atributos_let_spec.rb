require 'pessoa'

describe 'Atributos' do
  
  let(:pessoa) { Pessoa.new } #roda sempre na hora que é chamado(utilizado) dentro do teste
  # let!(:pessoa) { Pessoa.new } #roda sempre na hora que começar qualquer teste
  #pessoa = Pessoa.new


  it 'have_attributes' do
    pessoa.nome = 'Gustavo'
    pessoa.idade = 20
    expect(pessoa).to have_attributes(nome: a_string_starting_with('Gu'), idade: (a_value >= 20))
  end

  it 'have_attributes' do
    pessoa.nome = 'Gabriel'
    pessoa.idade = 24
    expect(pessoa).to have_attributes(nome: a_string_starting_with('Ga'), idade: (a_value >= 20))
  end

  it 'have_attributes_incorrects', aggregate_failures: true do
    pessoa.nome = 'Gabriel'
    pessoa.idade = 21
    expect(pessoa).to have_attributes(nome: a_string_starting_with('Ga'), idade: (a_value >= 20))
  end
end
