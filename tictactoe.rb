puts "Let's play Tic Tac Toe! \nPlayer wins with three in a row."

def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' ' }
  board
end

def empty_positions(board)
  board.keys.select {|position| board[position] == ' '}
end

def player_one (board)
  begin
    puts "Please choose a position:"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = 'X'
end

def player_two(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player1" if board.values_at(*line).count('X') == 3
    return "Player2" if board.values_at(*line).count('O') == 3
  end
  nil
end

def all_spaces_filled?(board)
  empty_positions(board) == []
end

def say_winner(winner)
  puts "#{winner} wins!"
end

def build_board(board)
  system 'clear'
  puts "\t #{board [1]} | #{board[2]} | #{board[3]}"
  puts "\t---+---+---"
  puts "\t #{board [4]} | #{board[5]} | #{board[6]}"
  puts "\t---+---+---"
  puts "\t #{board [7]} | #{board[8]} | #{board[9]}"
end

board = initialize_board
build_board(board)
begin
  player_one(board)
  build_board(board)
  player_two(board)
  build_board(board)
  winner = check_winner(board)
end until winner || all_spaces_filled?(board)
if winner
  say_winner(winner)
else
  puts "It's a tie.\nGame Over!"
end
