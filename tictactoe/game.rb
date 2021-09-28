# frozen_string_literal: true

# Game class
class Game

  WINNING_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                    [0, 4, 8], [2, 4, 6]].freeze

  @@counter_of_moves = 1

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def draw_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---+---+---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---+---+---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def game_over?
    WINNING_COMBOS.any? do |combo|
      [@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq.length == 1
    end
  end

  def input_move
    puts 'Choose place on board'
    input = gets.chomp
    if /[0-9]/.match?(input)
      input
    else
      input_move
    end
  end

  def valid_move?(number)
    @board[number - 1] == number
  end

  def move(number)
    if valid_move?(number)
      @board[number - 1] = @@counter_of_moves.even? ? 'O' : 'X'
      @@counter_of_moves += 1
    end
  end

  def play
    until game_over? || @@counter_of_moves == 10
      draw_board
      player_move = input_move.to_i
      move(player_move)
    end
    draw_board

    if @@counter_of_moves == 10 && game_over? == false
      puts 'Tie. No one wins.'
    else
      puts "#{@@counter_of_moves.even? ? 'X' : 'O'} wins! Good Job!"
    end
  end
end
