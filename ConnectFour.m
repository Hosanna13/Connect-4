function [winner,playagain] = ConnectFour(player1,player2)
%CONNECTFOUR: Connect Four Game, created By Hosanna Otchere
clc
clear
% Game Message 
welcome = "Welcome to Connect 4"; 
disp(welcome)
pieces = "Black Player 1 , and Red = Player 2.";
disp(pieces)
player1message = "Player 1, you are going first.";
disp(player1message)


% Inialtize Game Board
scene = simpleGameEngine('ConnectFour.png',86,101);
rows = 6;
cols = 7;


% Varibles for Sprities
empty = 1;
red = 2;
black = 3;

% Display empty board: 6 X 7 
gameboard = ones(rows,cols)*empty;
drawScene(scene,gameboard);

% Player Input
player1 = black;
player2 = red; 
currentPlayer = player1; % Start with Player 1

% Turn  Count: 
turnCounter = 1;
% Main Loop
gameover = 0;
while gameover == 0

   % Get player input
   [row, col, button] = getMouseInput(scene);


   % Check if piece can be dropped into column
   if col >= 1 && col <= cols && gameboard(1, col) == empty
       gameboard = DropPiece(gameboard, currentPlayer, col);


       % Update the board display
       drawScene(scene, gameboard);

        % Switch to the other player
       if currentPlayer == player1
           currentPlayer = player2;
           player2asvar = "Player 2";
           fprintf("%s, it\'s your turn!\n", player2asvar);
           [row, col, button] = getMouseInput(scene);

            [winner, gameover] = CheckWin(gameboard, player1, player2);
       else
          currentPlayer = player1;
          player1asvar = "Player 1";
          fprintf("%s, it\'s your turn!\n", player1asvar)
          [row, col, button] = getMouseInput(scene);
          
           [winner, gameover] = CheckWin(gameboard, player1, player2);
       end

       % Check for a winner or a tie
        %[winner, gameover] = CheckWin(gameboard, player1, player2);

        % Check for Winner
        if winner == 1 | winner == 2 
            fprintf('Congrats Player %.0f!\n',winner)
            gameover = 1; 
        end 


         if gameover == 1
            % If the game is over, ask the user if they want to play again
            tryAgain = input('Try again? (y/n): ', 's'); 
            if lower(tryAgain) == 'y'
                % If the user chooses to restart, recall function
                game = ConnectFour();
                continue; % Restart the loop
            else
                % If the user chooses to exit, break out of the loop and end
                % the game. 
                break; 
            end


       % Check for a tie (all slots filled)
       if (gameboard(:,:) ~= empty)
           gameover = 1;
           winner = 0;
       end
         end
   end
end

