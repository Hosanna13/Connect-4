# Technical Description:
## Game Flow
First the game starts with a welcome message and setup information. Players then take turns clicking on a column to drop their pieces. Then the game checks for valid moves, updates the board, and switches to the next player. Then the program checks for a winning condition or a tie. If the game ends, then players are asked to play again or exit. 
## Variable Names and Uses
- welcome = string game welcome message later used in “disp” function. 
- pieces = string message for users to let them know what pieces they are assigned to, later used in “disp” function, 
- player1message = string message for player let them know that they are going first, latter used in the “disp” function.
- Scene = calls simplegameegnine to load sprites, which creates a graphic visualization of the game scene, within a MATLAB figure. 
- rows = defines the number of rows in the game board. This is to set the dimensions of the game board. 
- cols = defines the number of columns in the game board. This is to set the dimensions of the game board, and to check if the piece is valid to drop. 
- Gameboard = 6 x 7 game state matrix of one’s times the empty sprite. This represents the current game state. 
- player1 = is set to the black piece that is used in later functions. 
- player2 = is set to red piece
- currentplayer = player1 (used to switch between players starting with player one).
- turncounter = 1; this is not used. 
- gameover = determines if the game is over, set as 0, meaning false.
## Function and Uses:
### User Created Functions:
- DropPiece(gameboard, currentPlayer, col): is designed to update the game board by placing a player’s piece in the lowest avail slot within a given column. 
INPUTS: 
  - The input parameter is the gameboard(matrix) that represents the current state of the Connect Four game board. It’s a 6 x 7 matrix where each element shows the occupancy of a slot (1 for empty sprite, 2 for player 1, and 3 for player 2 piece). The variable ‘player’ represents the current player making a move. It takes the value of either 2 or 3, which corresponds to Player 1 or Player 2. The input ‘col’ gives the column index were the player wants to drop their piece, it is a value between 1 and 7. 
OUTPUTS: 
  - The output is the updated board which is a matrix that represents the game board after the player drops their piece. It keeps the same structure as the input gameboard, but with changes based on the player’s move. 
FUNCTION LOGIC:
  - The function uses the ‘find’ function to look for the lowest available slot in the given column of the game board.  The search is from the bottom to the top of the column. 
If the column is not full the player’s piece is placed in the lowest available slot. Then the element in that slot is updated to the value of the current player. 
Then the changed game board is returned as the updatedboard. 
- CheckWin(gameboard, player1, player2): 
INPUTS: 
The input parameters are the game board, player1, player2. 
OUTPUTS: 
The function outputs the winner which represents the player who won (0 means no winner). It takes the values 1 or based 2 based on whether Player 1 or Player 1 won. 
Gameover shows if the game is over, 1 meaning the game is over, and 0 otherwise. 
FUNCTION LOGIC: 
The function initializes variables winner and gameover to -. 
The variables ‘red’ and ‘black’ are assigned to values 2 and 3. 
Check Horizontal Locations For Win
This uses nested loops to go through all the possible starting locations for a horizontal win. Then it checks for four consecutive pieces of the same player horizontally. If the winning condition is met, it sets the variable checkhoriziotnal to 1 and updates the “winner” variable. 
Check Vertical Locations For Win: 
Similar to the horizontal check, it uses nested loops to go through all the possible starting locations for a vertical win. Then it checks for four consecutive pieces of the same player vertically. If a winning condition is met, it sets the variable “checkVertical” to 1 and updates the “winner” variable. 
Check Positive Diagonals for Win: 
Like the previous checks, it goes through all possible starting locations from the center, and it checks for four consecutive pieces of the same player along the positive diagonal. (positive slope of row and column).  If the winning condition is met, it sets the variable “postiveDiagonal” to 1 and updates the “winner” variable. 
Check Negative Diagonals for Win 
This is the opposite of positive diagonals, , it goes through all possible starting locations from the center, and it checks for four consecutive pieces of the same player along the negative diagonal. (negative slope of row and column).  If the winning condition is met, it sets the variable “postiveDiagonal” to 1 and updates the “winner” variable. 
The function then updates the gameover variable based on the checks, and then it returns “winner “and “gameover” values. 
MATLAB Functions and Uses:
disp(): displays messages on the command window. 
fprintf(): prints formatted text to the command window. 
ones(): creates a matrix of ones with given dimensions. 
drawScene(scene, gameboard): updates the graphical scene with the current state of the game board. 
Simplegameengine: takes the file name of a sprite sheet, sprite height, sprite width, zoom factor, and background color as input. Later it reads the sprite image data and its transparency. Then it divides the image into individual sprites and stores them in “sprites” and “sprites_transparency” .
getMouseinput: takes the player’s mouse input during their turn.
