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
        if @ships[place] == "S"
            @ships[place] = "S"
        else
            @ships[place] = "S"
            ship_counter += 1
        end
    end
end

#Create the board, and hide the ships unless hit.
def print_board
    for num in @board
        print num
        print " "
    end
    puts " "
    for x in 1..20 do
        
        if @ships[x] == "X" && x < 10
            print @ships[x]
            print " "
        elsif @ships[x] == "X" && x >= 10
            print @ships[x] + "  "
        elsif @ships[x] != "X" && x >= 10
        print "   "
        else
        print "  "
        end
    end
    puts " "
end
initialize_board
print_board

@guesses = 0
@hits = 0
@score = 0
# Use computer score and guesses to make a smarter computer player
@computer_score = 0
@computer_guesses = []
while @hits != 7 && @guesses != 10

computer_input = rand(1..20)
    
    #while 

    if @ships[computer_input] == "S"
        @ships[computer_input] = "X"
        puts "The Computer Player got a Hit!"
        @hits += 1
        @guesses += 1
        @computer_score += 10
    else
        puts "The Computer Player Missed!"
    end
    print_board
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
    puts "Computer Score: #{@computer_score}" 
    

end

if @hits == 7
    puts "All of the Ships have been hit!"
    puts "Your score is #{@score}."
    puts "The Computer's score is #{@computer_score}."
end

if @guesses == 10
    puts "Thank you for playing! Your final score is: #{@score}!"
    puts "The Computer's score is #{@computer_score}"
end