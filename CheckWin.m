function [winner, gameover] = CheckWin(gameBoard,player1, player2)
%CHECKWIN;  This function checks for the winning move. 
%   Input: 
%       gameBoard: Current game board state
%       player: Current player ( 1 or 2) 
%   Output: 
%       winner: Player who won (0 means no winner) 
%       gameover: 1 if the game is over, 0 otherwise

% Check Hortizotional Locations for the win 
%   Loops over all the possible starting locations for a horiztional win. 

winner = 0; 
red = 2; 
black = 3;  
checkHortizontial = 0; 
checkVertical = 0;
 postiveDiagonal = 0; 
 negativeDiagonal =0; 
gameover = 0;  

[numRows, numCols] = size(gameBoard);
for c = 1:numCols-3
    for r = 1:numRows;
    if (gameBoard(r,c) == red ) & (gameBoard(r,c+1) == red) & (gameBoard(r,c+2) == red) & (gameBoard(r,c+3) == red) 
        checkHortizontial = 1;
        winner = 2; 
    elseif(gameBoard(r,c) == black) & (gameBoard(r,c+1) == black) & (gameBoard(r,c+2) == black) & (gameBoard(r,c+3) == black)
        checkHortizontial = 1;
        winner = 1; 
    end 
    end 

end

% Check Vertical Locations for Win
for c = 1:numCols
    for r = 1:numRows-3
    if (gameBoard(r,c) == red ) & (gameBoard(r+1,c) == red) & (gameBoard(r+2,c) == red) & (gameBoard(r+3,c) == red) 
        checkVertical = 1;
        winner  = 2;
    elseif  (gameBoard(r,c) == black) & (gameBoard(r+1,c) == black) & (gameBoard(r+2,c) == black) & (gameBoard(r+3,c) == black)
        checkVertical = 1; 
        winner = 1; 
    end 
    end 
end 
    %fprintf('Game over! Winner: %d\n', winner) 

 % Posoitiviety Diagonals
 for c = 1:numCols-3
    for r = 1:numRows-3
    if (gameBoard(r,c) == red ) & (gameBoard(r+1,c+1) == red) & (gameBoard(r+2,c+2) == red) & (gameBoard(r+3,c+3) == red) 
        postiveDiagonal = 1;
        winner  = 2; 
    elseif(gameBoard(r,c) == black) & (gameBoard(r+1,c+1) == black) & (gameBoard(r+2,c+2) == black) & (gameBoard(r+3,c+3) == black)
        postiveDiagonal = 1;  
        winner = 1; 
    end 
    end 


 % Negaive Diagonals

 for c = 1:numCols-3
    for r = 3:numRows-3
    if (gameBoard(r,c) == red ) & (gameBoard(r-1,c+1) == red) & (gameBoard(r-2,c+2) == red) & (gameBoard(r-3,c+3) == red) 
        negativeDiagonal = 1
        winner = 2; 
    elseif (gameBoard(r,c) == black) & (gameBoard(r-1,c+1) == black) & (gameBoard(r-2,c+2) == black) & (gameBoard(r-3,c+3) == black)
        negativeDiagonal = 1;  
        winner = 1; 
    end 
    end
 end
end

