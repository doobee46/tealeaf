# The requirements for the Tic-Tac-Toe problem were the following:
   # A board that can be displayed and perhaps keep track of some state.
   # Two players: both human that would input moves  
   # A game ‘engine’ that actually runs the game, keeps track of turns and can determine when the game is over (either by a win or a tie).
   # 
   # Game algorythm   
   # Player ‘X’ goes first
   # Player ‘X’ places their marker on an empty board piece
   # Next, check to see if player ‘X’ won by getting three ‘X’s in a row
   # If not, check to see if there is a tie (a full board with no three of a kind in a row)
   
class  Game
    
    def initialize 
        @board ||= Array.new(3,' '){Array.new(3,' ')}
        @marker = ["X", "O"]
        #array that will be use to track all player move and use to find if there's any empty space on the board 
        @track_move ||= []
    end
    
    def create_players
        # create both players 
        @names = []
         
        print "Please enter the first player name: "
        @player_1 = gets.chomp
        @names << @player_1

        print "Please enter second player name: "
        @player_2 = gets.chomp
        @names << @player_2 
        
        puts "\n"
        puts"welcome #{@player_1.upcase} and #{@player_2.upcase}"
        puts"------------------------------------------------"
        puts"\n"
         
        puts "Randomizing who'll start..."
        sleep(1)
        puts"\n"
        # assign player by calling the player_assigment function that will determine who will start first
        player_assigment
        puts"\n"
    end
    
    def player_assigment
        # merge the names array and symbol array 
        # with the zip method and return a nested array with player and symbol.  
        @choice = @names.shuffle.zip(@marker)
        # iterate over the choice nested array and 
        # print out each player and their assigned symbol
        @assign = @choice.to_h
        @assign.each do |player, symbol| 
         puts "#{player.upcase} symbol is #{symbol}" 
        end
    end
    
    def first
        # choose the first array in choice nested array and return the first player and symbol
        first = @choice.first
        @first_player = first.first
        @symbol = first.last
        @current = @first_player
    end
    
    def second
        # choose the second array in choice nested array and return the first player and symbol
        second = @choice.last
        @second_player = second.first
        @symbol = second.last
        @current = @second_player
    end
    
    def first_turn
        first
        puts "it's #{@first_player.upcase} with '#{@symbol}' turn"
        make_move
    end
    
    def next_turn
        second
        puts "#{@second_player.upcase} with '#{@symbol}' turn"
        make_move
    end
    
    def invalid
        puts"Invalid move"
        print"\n"
    end
    
    def make_move
        print "Where to :"
        @move = gets.chomp.to_i
        print "\n"
        mapping(@move,@symbol)
    end
    
    def track_move(move)
        # each move will be assigned an integer value that will be used to determine if there's no more move left.
        if @current 
           @track_move.push(move)
        end
    end
    
    def process_move(move)
        print_board
        track_move(move)
        if move_left?
           end_print
           replay
        end
        check_win?
    end
    
    def mapping(move, symbol)
         case move
            when 0
                if @board[0][0]=="X" || @board[0][0] == "O"
                   invalid
                   make_move
                else
                   @board[0][0] = symbol
                   process_move(@move)
                end
              
            when 1
                if @board[0][1]=="X" || @board[0][1] == "O"
                   invalid
                   make_move
                else
                  @board[0][1] = symbol
                  process_move(@move)
                end
              
            when 2
                if @board[0][2]=="X" || @board[0][2] == "O"
                   invalid
                   make_move
                else
                   @board[0][2] = symbol
                   process_move(@move)
                end
             
            when 3
                if @board[1][0]=="X" || @board[1][0] == "O"
                   invalid
                   make_move
                else
                   @board[1][0] = symbol
                   process_move(@move)
                end
              
            when 4
                if @board[1][1]=="X" || @board[1][1] == "O"
                   invalid
                   make_move
                else
                   @board[1][1] = symbol
                   process_move(@move)
                end
              
            when 5
                if @board[1][2]=="X" || @board[1][2] == "O"
                   invalid
                   make_move
                else
                   @board[1][2] = symbol
                   process_move(@move)
                end
            
            when 6
                if @board[2][0]=="X" || @board[2][0] == "O"
                   invalid
                   make_move
                else
                   @board[2][0] = symbol
                   process_move(@move)
                end
              
            when 7
                if @board[2][1]=="X" || @board[2][1] == "O"
                   invalid
                   make_move
                else
                   @board[2][1] = symbol
                   process_move(@move)
                end
              
            when 8
                if @board[2][2]=="X" || @board[2][2] == "O"
                   invalid
                   make_move
                else
                   @board[2][2] = symbol
                   process_move(@move)
                end
                
            else 
                   invalid
                   make_move
        end
    end
    
    def end_print
        puts"-------------------------------------------------"
        puts "Game over. ".upcase 
        puts "No more moves left. "
        puts"-------------------------------------------------"
        print "\n"
    end
    
    
    def winner(player)
        puts"-------------------------------------------------"
        puts"#{player.upcase} wins!! TICTACTOE"
        puts "Game over. ".upcase
        puts"-------------------------------------------------"
        print"\n"
        replay
    end
    
    def replay
        print "Do you want to play again?(y/n)"
        print"\n"
        ans = gets.chomp
        if ans == "y"
        Game.start
        else
            exit
        end
    end
    
    def move_left?
        sum  = @track_move.inject{|r, s| r+s}
        if sum == 36
           return true
        end
    end
 
    def check_win?
        player = @current
        symbol = @symbol
        if @board[0][0] == symbol && 
           @board[0][1] == symbol &&
           @board[0][2] == symbol
           winner(player)
           
        elsif
           @board[1][0] == symbol && 
           @board[1][1] == symbol &&
           @board[1][2] == symbol
           winner(player)
          
        elsif
           @board[2][0] == symbol && 
           @board[2][1] == symbol &&
           @board[2][2] == symbol
           winner(player)
         
        elsif
           @board[0][1] == symbol && 
           @board[1][1] == symbol &&
           @board[2][1] == symbol
           winner(player)
         
        elsif
           @board[0][2] == symbol && 
           @board[1][2] == symbol &&
           @board[2][2] == symbol
           winner(player) 
          
        elsif
           @board[0][2] == symbol && 
           @board[1][1] == symbol &&
           @board[2][0] == symbol
           winner(player) 
           
        elsif
           @board[0][0] == symbol && 
           @board[1][1] == symbol &&
           @board[2][2] == symbol
           winner(player)
           
        end
         return false
    end
    
    # display board in a matrix format 
    def print_board
        @board.each_slice(1) { |a| p a }
        puts"\n"
    end
    
    def instructions
        puts"-------------------------------------------------"
        puts "Instructions :Enter your first move by entering a number 1-9" 
        puts "corresponding to the grid on the bottom and press enter"
        puts"-------------------------------------------------"
        puts"\n"
        puts "0 | 1 | 2 ",             
             "----------",              
             "3 | 4 | 5 ",             
             "----------",            
             "6 | 7 | 8 " 
        print"\n"
        
    end
    
    def players_turn
        loop do
            first_turn
            next_turn
        end
    end
    
    def self.start
        puts"------------------------------------------------"
        puts"              Welcome to tictactoe              ".upcase
        puts"------------------------------------------------"
        print"\n"
        new_game = Game.new
        new_game.create_players
        new_game.instructions
        new_game.players_turn
    end
    
   
       
   Game.start

end