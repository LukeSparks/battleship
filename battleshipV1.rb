def initialize_board
    @board = []
    @ships = []
    for x in 1..20 do
    @board << x
    end
    
    # Use a counter and an array full of spaces to created a "Ships" line to be printed beneath board.
    ship_counter = 0
    for x in 1..20 do
        @ships << " "
    end
    
    while ship_counter != 7
        place = rand(1..20)
        @ships[place] = "S"
        ship_counter += 1
    end
end

def print_board
    for num in @board
        print num
    end
    puts " "
    for val in @ships
        print val
    end
end
initialize_board
print_board

