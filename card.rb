class Card
    attr_reader :face_val, :visibility
    def initialize(face_val)
        @face_val = face_val
        @visibility = false
    end

    def display
        @visibility == true ? @face_val : nil
    end

    def hide
        @visibility = false
    end

    def reveal
        @visibility = true
    end
    
    def to_s

    end

    def ==(card_inst)
        self.face_val == card_inst.face_val
    end    
end