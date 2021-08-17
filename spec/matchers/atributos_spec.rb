require 'pessoa'

describe 'Atributos' do
  
  before(:each) do
    @pessoa = Pessoa.new
  end

  it 'have_attributes' do
    @pessoa.nome = 'Gustavo'
    @pessoa.idade = 20
    expect(@pessoa).to have_attributes(nome: a_string_starting_with('Gu'), idade: (a_value >= 20))
  end

  it 'have_attributes' do
    @pessoa.nome = 'Gabriel'
    @pessoa.idade = 24
    expect(@pessoa).to have_attributes(nome: a_string_starting_with('Ga'), idade: (a_value >= 20))
  end
end
