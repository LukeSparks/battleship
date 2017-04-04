def initialize_board
    @top_row =[]
    @left_column =[]
    @board = []
    
    for num in 1..5 do
        @top_row << num
        @left_column << num
    end
    #Add the 5 arrays into the larger board array
    5.times do 
        @board << []
    end
    #Add 5 spaces to each array
    for num in 1..5 do
        @board[0] << " "
        @board[1] << " "
        @board[2] << " "
        @board[3] << " "
        @board[4] << " "
    end
end

#Define how we will print the board to the terminal
def print_board
    for num in 0..4 do
        print "   " + @top_row[num].to_s + " "
    end
    puts ""
    for num in 0..4 do
     puts "#{@left_column[num].to_s} #{@board[num]}"
    end
end

#Define how we will capture a player's column and row input
def player_guess
    puts "Please enter the row you think the ship is in:"
    @row_input = gets.chomp
    puts "Please enter the column you think the ship is in:"
    @column_input = gets.chomp
end

initialize_board
print_board
#player_guess