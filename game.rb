require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"
require "byebug"

class Game 

    def initialize(dim)
        @board = Board.new(dim)
        @previous_guess_pos = nil
        @human_player = HumanPlayer.new 
    end

    def play
        @board.populate
        while @board.won? == false
            @board.render
            user_input = @human_player.prompt("first")
            @previous_guess_pos = user_input.map(&:to_i)
            previous_guess = @board.reveal(@previous_guess_pos)
            @board.render
            self.make_guess(previous_guess) 
        end    
        puts "Congrats you win!"
    end

    def make_guess(previous_guess)
        user_input = @human_player.prompt("second")
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