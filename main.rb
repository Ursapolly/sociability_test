# encoding: utf-8

# тест взят с сайта http://syntone.ru/psytesty/vash-uroven-obshhitelnosti/

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/test'
require_relative 'lib/result_printer'

name = ARGV[0]

name = 'Анонимус' if name == nil

current_path = File.dirname(__FILE__)
questions_path = current_path + '/data/questions.txt'
results_path = current_path + '/data/results.txt'

puts "Приветствуем, #{name}! Этот тест поможет понять ваш уровень общительности.\nОтветьте на несколько вопросов."
puts "За каждый ответ \"да\" начисляется 2 балла, за ответ \"нет\" — 0 баллов, за ответ \"иногда\" — 1 балл."
puts "Для удобства пользуйтесь цифрами: 0 — нет, 1 — иногда, 2 — да."
puts

test = Test.new(questions_path)
result = ResultPrinter.new(results_path)

until test.finished?
  test.ask_question
end

puts "\n#{name}"
puts "\nВаш результат (#{test.score} баллов): #{result.print_result(test)}"