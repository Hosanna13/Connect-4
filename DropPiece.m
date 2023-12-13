function updatedBoard  = DropPiece(gameBoard,player, col)
%DROPPIECE
%  Input: 
%       gameBoard: Current game board state
%       player: Current player (1 or 2) 
%       col: Column where the player  wants to drop the pieces
%   Output: 
%    updatedBoard: Gameboard after dropping the piece 

% Look For the lowest available slot in the given colmum 
row = find(gameBoard(:,col)==1,1,'last');

if ~isempty(row)
    % Place the player's piece in the lowest avaible solt
    gameBoard(row,col) = player; 
end

% Return Updated game board 
updatedBoard = gameBoard;
end 

