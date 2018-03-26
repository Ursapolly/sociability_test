# encoding: utf-8

class Test
  attr_reader :score

  def initialize(question_path)
    unless File.exist?(question_path)
      abort "Файл с вопросами #{question_path} не найден"
    end
    f = File.new(question_path, 'r:UTF-8')
    @questions = f.readlines
    f.close
    @question = 0
    @score = 0
    @user_input = nil
  end

  def finished?
    @question >= @questions.size
  end

  def ask_question
    puts @questions[@question]
    @user_input = STDIN.gets.to_i
    until @user_input == 0 || @user_input == 1 || @user_input == 2
      puts "Введите 0, 1 или 2, нажмите enter"
      @user_input = STDIN.gets.to_i
    end
    @question += 1
    @score += 2 if @user_input == 2
    @score += 1 if @user_input == 1
  end
end