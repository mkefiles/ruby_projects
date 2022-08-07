class Game
    # give variable(s) read-only access
    attr_reader :player_X_object
    attr_reader :player_O_object

    def initialize(player_X_object, player_O_object)
        # define attributes upfront
        @player_X_object = player_X_object
        @player_O_object = player_O_object
        @@game_board = [1,2,3,4,5,6,7,8,9]
        # all method calls
        puts current_players
        game_rules
        display_board
        # infinite-loop; loop-exit handled in logic
        loop do
            play
        end
    end
    def current_players
        # output players (and characters) to console
        return "X is: #{@player_X_object.get_name} and O is: #{player_O_object.get_name}"
    end
    def game_rules
        # output rules to console
        puts ""
        puts "The game is simple. Each player will select a position by typing a value 1 - 9 to place their character (either 'X' or 'O'). Whoever is the first to get three values in a row, a column, or a diagonal line wins."
    end
    def display_board
        # output the game-board
        puts ""
        puts " #{@@game_board[0]} | #{@@game_board[1]} | #{@@game_board[2]} "
        puts "-----------"
        puts " #{@@game_board[3]} | #{@@game_board[4]} | #{@@game_board[5]} "
        puts "-----------"
        puts " #{@@game_board[6]} | #{@@game_board[7]} | #{@@game_board[8]} "
        puts ""
    end
    def play
        # request user-input (see Player class)
        @player_X_object.set_move
        # grab user-input (see Player class)
        selected_move = @player_X_object.get_move
        # update the board
        place_move(@player_X_object, "X", selected_move)
        # check if victory or draw
        game_outcome(@player_X_object)
         # request user-input (see Player class)
        @player_O_object.set_move
        # grab user-input (see Player class)
        selected_move = @player_O_object.get_move
        # update the board
        place_move(@player_O_object, "O", selected_move)
        # check if victory or draw
        game_outcome(@player_O_object)
    end
    def place_move(player, character, slot)
        # check if desired move has already been taken
        # if not, then allow and show board
        if @@game_board[slot-1] == slot
            @@game_board[slot-1] = character
            display_board
        # if so, then tell the user the lose their turn
        else
            puts "That location has already been selected and for not paying attention you have forfeited your move."
            player.set_moves
            display_board
            print player.get_moves  
        end
    end
    def game_outcome(player)
        current_player_moves = player.get_moves
        has_won = false
        draw_board = [1,2,3,4,5,6,7,8,9]
        winning_solutions = [
            [1,2,3],
            [4,5,6],
            [7,8,9],
            [1,4,7],
            [2,5,8],
            [3,6,9],
            [1,5,9],
            [3,5,7]
        ]
        # check players moves against all possible winning scenarios
        winning_solutions.each {
            |winning_solution|
            if (winning_solution - current_player_moves).empty? == true
                has_won = true
            end
        }
        # if player has won, output to console and exit game
        if has_won == true
            print "#{player.get_name} has won. Congratulations!"
            exit 0
        end
        # check if all positions have been taken; output 'draw' if so
        # array subtraction won't remove any values if none in common
        if (draw_board - @@game_board).length == 9
            print "We have a draw."
            exit 0
        end
    end
end

class Player
    def initialize(number)
        @number = number
        @name = ""
        @player_move = []
    end
    def get_name
        return @name
    end
    def set_name
        print "Player #{@number}, what is your game-name? "
        @name = gets.chomp
    end
    def get_move
        # returns the last element in the array (i.e., most recent move)
        return @player_move[-1]
    end
    def get_moves
        return @player_move
    end
    def set_moves
        # removes the most recent move if found to already be taken on board
        return @player_move.pop
    end
    def set_move
        desired_move = ""
        # continues requesting move until it is valid input
        until ["1","2","3","4","5","6","7","8","9"].include? desired_move
            print "#{@name}, what is your move? "
            desired_move = gets.chomp
            if ["1","2","3","4","5","6","7","8","9"].include?(desired_move) == false
                puts "Please enter a valid move!"
            end
        end
        # appends valid input to users move-history
        @player_move.push(desired_move.to_i)
    end
end

# create both players
player_one = Player.new("one")
player_two = Player.new("two")
player_one.set_name
puts "Welcome, #{player_one.get_name}."
puts ""
player_two.set_name
puts "Welcome, #{player_two.get_name}."
puts ""
# shuffle the players in an array
# who plays as 'X' vs 'O' is decided by the code at random
players = [player_one, player_two].shuffle
# pass the players to the game; order unknown
tic_tac_toe = Game.new(players[0], players[1])