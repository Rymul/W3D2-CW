class HumanPlayer

    def prompt(prompt_text)
        puts "Enter a #{prompt_text} position for example '0 0'"
        user_input = gets.chomp.split(' ')
    end

end
