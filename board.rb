require_relative "./card.rb"


class Board

    @@deck = 'abcdefghijklmnopqrstuvwxyz'.split('')

    def initialize(dim)
        @grid = Array.new(dim) {Array.new(dim)}
    end

    def populate
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                self[[i, j]] = Card.new(@@deck.sample)
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


end


