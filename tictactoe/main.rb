# frozen_string_literal: true

require_relative 'game'

def start
  game = Game.new
  game.play
  repeat
end

def repeat
  puts "Do you wanna play again? 'y' for Yes or 'n' for No."
  input = gets.chomp.downcase
  if input == 'y'
    start
  else
    puts 'See you again!'
    exit!
  end
end

start
