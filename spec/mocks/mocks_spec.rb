require 'student'
require 'course'

describe 'Mocks' do
  it '#bar' do
    student = Student.new

    expect(student).to receive(:bar)

    student.bar
  end

  it '#foo' do
    student = Student.new

    expect(student).to receive(:foo).with(123)

    student.foo(123)
  end

  it 'loop' do
    student = Student.new

    expect(student).to receive(:foo).with(123).twice

    student.foo(123)
    student.foo(123)
  end

  it 'return' do
    student = Student.new

    expect(student).to receive(:foo).with(123).and_return(true)

    student.foo(123)
  end
end