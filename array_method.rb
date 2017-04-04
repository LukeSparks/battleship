def multi_array(x,y)
    @board = Array.new(x) {Array.new(y)}
end
def user_input
    puts "How many rows would you like the board to have?"
    @row_input = gets.chomp
    puts "How many columns would you like the board to have?"
    @olumn_input = gets.chomp
end
user_input
multi_array(@row_input.to_i,@column_input.to_i)
print @board