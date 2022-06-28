require_relative "./card.rb"


class Board

    @@deck = 'abcdefghijklmnopqrstuvwxyz'.split('')

    def initialize(dim)
        @grid = Array.new(dim) {Array.new(dim)}
            if (dim > 6) && (dim % 2 != 0)
                raise 'Invalid dimension'
            end
        @dim = dim
        # @game_deck = self.make_deck
    end

    def make_deck
        hash = Hash.new {|h, k| h[k] = 2}

        deck_array = @@deck.sample(@dim * @dim / 2)

        deck_array.each do |face|
            hash[face]
        end

        hash
    end

    # def empty?(pos)
    #     self[pos] == nil
    # end

    def populate
        validpos = []
        (0...@dim).each do |i|
            (0...@dim).each do |j|
                validpos << [i, j]
            end
        end
        hash = self.make_deck

        hash.each do |k, v|
            while v > 0
                pos = validpos.sample
                validpos.delete(pos)
                # if self.empty?(pos)
                    self[pos] = Card.new(k)
                    v -= 1
                # end
            end
        end
        true
    end

    def [](pos)
        row, col = pos
        @grid[row][col] 
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def hidden_grid
        @grid.map do |subarr|
            p subarr.map { |card| card.face_val }.join(' ')
        end
    end

    def render
        @grid.map do |subarr|
            p subarr.map { |card| card.visibility ? card.face_val : "X" }.join(' ')
            # p subarr.map do |card|
            #     if(card.visibility)
            #         card.face_val
            #     else
            #         "X"
            #     end
            # end.join(' ')
        end
    end

    def won?
        @grid.all? { |row| row.all? { |card| card.visibility }}
    end

    def reveal(guessed_pos)
        current_card = self[guessed_pos]
        if current_card.visibility == false
            current_card.reveal
            return current_card.face_val
        end
        nil
    end



end


