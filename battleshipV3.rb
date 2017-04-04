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
    for x in 1..20 do
        
        if @ships[x] == "X" && x < 10
            print @ships[x]
        elsif @ships[x] == "X" && x >= 10
            print " " + @ships[x] + " "
        elsif @ships[x] != "X" && x >= 10
        print "  "
        else
        print " "
        end
    end
    puts " "
end
initialize_board
print_board

@guesses = 0
@hits = 0
@score = 0
while @hits != 6 && @guesses != 10
puts "What columns do you think the boats are in?"
    user_input = gets.chomp.to_i

    if @ships[user_input] == "S"
        @ships[user_input] = "X"
        puts "Hit!"
        @hits += 1
        @guesses += 1
        @score += 10
    else
        puts "Miss!"
        @guesses += 1
    end
print_board
puts "Score: #{@score}"

end

if @guesses == 10
    puts "Thank you for playing! Your final score is: #{@score}!"
end