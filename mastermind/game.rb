# frozen_string_literal: true

require_relative 'tutorial'
require_relative 'text_content'

# Game class
class Game
  include Tutorial
  include TextContent

  def initialize
    @password = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  end

  def play
    puts tutorial
    selected_game_mode = select_game_mode
    mode('breaker') if selected_game_mode == 1
    mode('coder') if selected_game_mode == 2
  end

  def select_game_mode
    puts game_mode_selection
    input = gets.chomp
    return input.to_i if input.match(/^[1-2]$/)

    puts warning_message('select_game_error')
    select_game_mode
  end

  def mode(type)
    turn = 1
    while turn <= 12
      guess = (type == 'breaker' ? player_input : ai_input)
      checked = check(guess)
      feedback(guess, checked)
      break if checked.all? 2

      turn += 1
    end

    print_end_message(type, turn)
  end

  def player_input
    puts 'Enter code: '
    code = gets.chomp.scan /\w/
    return code.map(&:to_i) if code.each { |num| num =~ /^[1-6]$/ } && (code.length == 4)

    puts warning_message('code_error')
    player_input
  end

  def ai_input
    [1, 1, 1, 1]
  end

  def check(guess)
    result = [0, 0, 0, 0]

    (0...4).each do |i|
      result[i] = 1 if @password.include? guess[i]
      result[i] = 2 if @password[i] == guess[i]
    end

    result
  end

  def feedback(guess, result)
    show_code(guess)
    print ' | '
    show_clue(result)
    puts
  end
end
