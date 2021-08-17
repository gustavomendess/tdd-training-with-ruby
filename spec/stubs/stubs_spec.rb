require 'student'
require 'course'

# um stub é forçar uma resposta específica para um determinado método de um objeto, esse método pode estar ou não implementado

describe 'Stub' do
  it '#has_finished' do
    student = Student.new
    course = Course.new

    allow(student).to receive(:has_finished?)
                  .with(an_instance_of(Course))
                  .and_return(true)

    finished_course = student.has_finished?(course)

    expect(finished_course).to be_truthy
  end

  it 'Argumentos dinamicos' do
    student = Student.new

    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        'Olá'
      elsif arg == :hi
        'Oi'
      end
    end

    expect(student.foo(:hello)).to eq('Olá')
    expect(student.foo(:hi)).to eq('Oi')
  end

  it 'Qualquer instancia' do
    student = Student.new
    other_student = Student.new

    allow_any_instance_of(Student).to receive(:bar).and_return(true)

    expect(student.bar).to be_truthy
    expect(other_student.bar).to be_truthy
  end

  it 'Erros' do
    student = Student.new

    allow(student).to receive(:bar).and_raise(RuntimeError)

    expect{student.bar}.to raise_error(RuntimeError)
  end
end