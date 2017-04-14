def initialize_board
    @board = []  # lets not make these global variables, lets instead have this method return a board. we can then pass it into print_board
    @ships = []
    for x in 1..20 do # don't need a loop here, you can do : @board = 1.upto(20).to_a or @board = (1..20).to_a
    @board << x # indent this in since its inside the loop
    end
    
    # Use a counter and an array full of spaces to created a "Ships" line to be printed beneath board.
    ship_counter = 0
    for x in 1..20 do # don't need a loop here, you can do @ships = [' '] * 20
        @ships << " "
    end

    while ship_counter != 7
        place = rand(1..20)  # should be 0 to 19 to avoid error and to place in first location of array
        if @ships[place] == "S" # you can make this an `unless` statement or just check for `if !=`
            @ships[place] = "S"
        else
            @ships[place] = "S"
            ship_counter += 1
        end
    end
    
    # should return the board here with: `return board` or `board`
end

# Create the board, and hide the ships unless hit.
def print_board # check out ljust and center on the string class to help with formatting
    for num in @board
        print num
        print " " # use single quotes ' ' when working with regualr strings, only use double quotes when doing string interpolation
    end
    puts " " # just `puts` without any arguments works too
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
        
        ######
        # has_ship = @ships[x] == "X"
        # if has_ship # this if-statment as a ternary is: print (has_ship? ? 'X' : ' ')
        #   print 'X' 
        # else
        #   print ' '
        # end
        # print ' ' if x >= 10
        #
        ####
    end
    puts " "
end
initialize_board
print_board

@guesses = 0 # i recommend using a local variable for all of these
@hits = 0
@score = 0
# Use computer score and guesses to make a smarter computer player
@computer_score = 0
@computer_guesses = []
while @hits != 7 && @guesses != 10
# consider renaming computer_input to computer_selection
computer_input = rand(1..20) # indent this in since its insdie the loop
    
    #while 
    # play_turn('computer', computer_input)
    if @ships[computer_input] == "S"
        @ships[computer_input] = "X"
        puts "The Computer Player got a Hit!"
        @hits += 1
        @guesses += 1 # should this happen?
        @computer_score += 10
    else
        puts "The Computer Player Missed!"
    end
    print_board
    puts "What columns do you think the boats are in?"
    user_input = gets.chomp.to_i

    # play_turn('user', user_input)
    if @ships[user_input] == "S"
        @ships[user_input] = "X"
        puts "Hit!"
        @hits += 1
        @guesses += 1
        @score += 10
    else
        puts "Miss!"
        @guesses += 1 # looks like this should be outside the loop since it happens in both if and else cases
    end
    print_board
    puts "Score: #{@score}"
    puts "Computer Score: #{@computer_score}" 
    

end

# def play_turn(player_string, input)
#  if @ships[input] == "S"
#         @ships[input] = "X"
#         puts "The #{player_sting} got a Hit!"
#         @hits += 1
#         @guesses += 1 # should this happen?
#         @computer_score += 10
#     else
#         puts "The #{player_sting} Missed!"
#     end
# end

if @hits == 7
    puts "All of the Ships have been hit!"
    puts "Your score is #{@score}."
    puts "The Computer's score is #{@computer_score}."
end

if @guesses == 10
    puts "Thank you for playing! Your final score is: #{@score}!"
    puts "The Computer's score is #{@computer_score}"
end
