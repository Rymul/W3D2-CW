require_relative = "board.rb"
require_relative = "card.rb"


class ComputerPlayer

    def initialize(dim)
        @valid_pos = Board.gen_valid_arr(dim)
        @guessed = Hash.new
        @previous_guess = [] # array whose 0th element is the face value and the 1st element is the position
    end

    def prompt(prompt_text)
        puts "Enter a #{prompt_text} position for example '0 0'"

        if prompt_text == "first"
            self.make_guess_one
        else
            self.make_guess_two
        end




        
    end


    def make_guess_one
        if(@guessed.has_key?(@previous_guess[0])
            return @previous_guess[1].map(&:to_s)
        else

            new_guess = @valid_pos.sample
            @guessed[new_guess.face_val]
            @valid_pos.delete(new_guess)
            return new_guess
        end
    end


    # def make_guess_two(face_val, pos)
    #     if @guessed.has_key?(face_val)
    #         return @guessed[face_val]
    #     else
    #         @guessed[face_val] = pos
    #         self.make_guess_one
    #     end
    # end



end