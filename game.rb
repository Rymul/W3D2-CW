require_relative "board.rb"
require_relative "card.rb"
require "byebug"

class Game 

    def initialize(dim)
        @board = Board.new(dim)
        @previous_guess_pos = nil    
    end

    def play
        @board.populate
        while @board.won? == false
            @board.render
            puts "Enter a position for example '0 0'"
            user_input = gets.chomp.split(' ')
            @previous_guess_pos = user_input.map(&:to_i)
            previous_guess = @board.reveal(@previous_guess_pos)
            @board.render
            self.make_guess(previous_guess) 
        end    
        puts "Congrats you win!"
    end

    def make_guess(previous_guess)
        puts "Enter a second position for example '0 0'"
        user_input = gets.chomp.split(' ')
        pos2 = user_input.map(&:to_i)
        current_guess = @board.reveal(pos2)
        current_card = @board[pos2]
        previous_card = @board[@previous_guess_pos]
        @board.render
        if previous_guess == current_guess
            puts "It's a match!"
        else
            puts "Sorry! Try again."
 
            previous_card.hide
            current_card.hide
        end
        sleep(3)
    end
    

end

game1 = Game.new(2)
game1.play