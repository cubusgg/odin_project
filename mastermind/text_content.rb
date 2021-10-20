# frozen_string_literal: true

require_relative 'string'
# module with text
module TextContent
  def game_mode_selection
    puts 'GAME MODES:'
    puts '---------------'
    puts '1. Breaker'
    puts '2. Coder'
  end

  def code_colors(code)
    {
      1 => "\e[41m  1  \e[0m",
      2 => "\e[42m  2  \e[0m",
      3 => "\e[43m  3  \e[0m",
      4 => "\e[44m  4  \e[0m",
      5 => "\e[45m  5  \e[0m",
      6 => "\e[46m  6  \e[0m"
    }[code]
  end

  def clue_colors(clue)
    {
      0 => " \u25cf ".gray,
      1 => " \u25cf ",
      2 => " \u25cf ".red
    }[clue]
  end

  def show_code(array)
    array.each do |num|
      print code_colors num
    end
  end

  def show_clue(array)
    array.each do |num|
      print clue_colors num
    end
  end

  def warning_message(message)
    {
      'select_game_error' => "Enter '1' to be breaker or '2' to be coder.",
      'code_error' => 'Enter four numbers to break code.'
    }[message]
  end

  def end_message(message)
    {
      'win' => 'Yeah! You won!',
      'lose' => 'Shit, maybe next time.'
    }[message]
  end

  def print_end_message(type, turn)
    if type == 'breaker'
      puts end_message('win') if turn < 13
      puts end_message('lose') if turn == 13
    else
      puts end_message('lose') if turn < 13
      puts end_message('win') if turn == 13
    end
  end
end
