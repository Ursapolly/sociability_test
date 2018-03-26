# encoding: utf-8

class ResultPrinter
  def initialize(result_path)

    unless File.exist?(result_path)
      abort "Файл с результатами #{result_path} не найден."
    end

    f = File.new(result_path, 'r:UTF-8')
    @results = f.readlines
    f.close
  end

  def print_result(test)
    case test.score
    when (32..30) then @results[0]
    when (25..29) then @results[1]
    when (19..24) then @results[2]
    when (14..18) then @results[3]
    when (9..13) then @results[4]
    when (4..8) then @results[5]
    else
      @results[6]
    end
  end
end