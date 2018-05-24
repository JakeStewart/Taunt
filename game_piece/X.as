package game_piece 
{
	import flash.display.GraphicsPathWinding;
	
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import game_piece.GamePiece;
	import preview_path.DiagonalLeft;
	import preview_path.DiagonalRight;
	import preview_path.DotDestination;
	import preview_path.DotMidway;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class X extends GamePiece 
	{
		
		public function X(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = -4) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			blackImg = new Image(Images.XBLACK);
			whiteImg = new Image(Images.XWHITE);
			
			
			super.init();
			
			
			subType1 = "X";
		}
		// -------------------------------------------------------------
		
		override public function createPaths():void 
		{
			super.createPaths();
			
			
			// Add the left path first.
			// Left path, as in relative to the viewer. Not relative
			// to the forward direction of the game piece.
			createLeftPath();
			
			// Add the right path.
			createRightPath();
			
			createMoveToButtons();
		}
		
		private function getSpaceDifference(column:Array, oneOrZero:uint, posOrNeg:int, upDiag:int, downDiag:uint):int
		{
			if (isInRowOrColumn(column))
			{
				if (isMovingUp)
				{
					if (currentSpace == 5 + oneOrZero) return 0;
					else return -8;
				}
				else
				{
					if (currentSpace == 33 + oneOrZero) return 0;
					else return 8;
				}
			}
			else
			{
				if (isMovingUp)
				{
					if (isInRowOrColumn(row2)) return 2 * posOrNeg;
					else return upDiag;
				}
				else
				{
					if (isInRowOrColumn(row9)) return 2 * posOrNeg;
					else return downDiag;
				}
			}
		}
		
		private function createLeftPath():void
		{
			if (!isInRowOrColumn(column1))
			{
				spaceDiff = getSpaceDifference(column2, 0, -1, -10, 6);
				
				if (!isOnSameTeam(spaceDiff))
				{
					// First line
					if (isMovingUp) addDirection(3, DiagonalLeft, DotMidway, -65, -65, -65, -65, true);
					else addDirection(3, DiagonalRight, DotMidway, -65, 0, -65, 65);
					
					if (spaceDiff != 0)
					{
						// Second line
						if (spaceDiff == -2)
						{
							if (isMovingUp) addDirection(3, DiagonalRight, DotDestination, -130, -65, -130, 0, true); // Bounce left off the ceiling (direction change)
							else addDirection(3, DiagonalLeft, DotDestination, -130, 0, -130, 0); // Bounce left off the floor (direction change)
						}
						else if (spaceDiff == -8) addDirection(3, DiagonalRight, DotDestination, -65, -130, 0, -130); // Bounce up off the left wall
						else if (spaceDiff == 8) addDirection(3, DiagonalLeft, DotDestination, -65, 65, 0, 130, true); // Bounce down off the left wall
						else if (spaceDiff == -10) addDirection(3, DiagonalLeft, DotDestination, -130, -130, -130, -130); // Up and to the left 2 spaces
						else if (spaceDiff == 6) addDirection(3, DiagonalRight, DotDestination, -130, 65, -130, 130, true); // Down and to the left 2 spaces
					}
				}
			}
		}
		
		private function createRightPath():void
		{
			if (!isInRowOrColumn(column4))
			{
				spaceDiff = getSpaceDifference(column3, 1, 1, -6, 10);
				
				if (!isOnSameTeam(spaceDiff))
				{
					// First line
					if (isMovingUp) addDirection(1, DiagonalRight, DotMidway, 0, -65, 65, -65, true);
					else addDirection(1, DiagonalLeft, DotMidway, 0, 0, 65, 65);
					
					if (spaceDiff != 0)
					{
						// Second line
						if (spaceDiff == 2)
						{
							if (isMovingUp) addDirection(1, DiagonalLeft, DotDestination, 65, -65, 130, 0, true); // Bounce right off the ceiling (direction change)
							else addDirection(1, DiagonalRight, DotDestination, 65, 0, 130, 0); // Bounce right off the floor (direction change)
						}
						else if (spaceDiff == -8) addDirection(1, DiagonalLeft, DotDestination, 0, -130, 0, -130); // Bounce up off the right wall
						else if (spaceDiff == 8) addDirection(1, DiagonalRight, DotDestination, 0, 65, 0, 130, true); // Bounce down off the right wall
						else if (spaceDiff == -6) addDirection(1, DiagonalRight, DotDestination, 65, -130, 130, -130); // Up and to the right 2 spaces
						else if (spaceDiff == 10) addDirection(1, DiagonalLeft, DotDestination, 65, 65, 130, 130, true); // Down and to the right 2 spaces
					}
				}
			}
		}
		// -------------------------------------------------------------
		
		private function createMoveToButtons():void 
		{
			createLeftMoveToButton();
			createRightMoveToButton();
		}
		
		private function createLeftMoveToButton():void
		{
			if (!isInRowOrColumn(column1))
			{
				if (isInRowOrColumn(column2))
				{
					if (isMovingUp)
					{
						if (currentSpace != 5) addMoveToButton(3, x, y - 130, -8, .6, true, x - 65, y - 65); // Bounce upward off left wall.
						else addMoveToButton(3, x, y, 0, .6, true, x - 65, y - 65); // Bounce off top left corner & back to same space.
					}
					else
					{
						if (currentSpace != 33) addMoveToButton(3, x, y + 130, 8, .6, true, x - 65, y + 65); // Bounce downward off left wall.
						else addMoveToButton(3, x, y, 0, .6, true, x - 65, y + 65); // Bounce off bottom left corner & back to same space.
					}
				}
				else // GamePiece is in column 3 or 4
				{
					if (isMovingUp)
					{
						if (isInRowOrColumn(row2)) addMoveToButton(3, x - 130, y, -2, .6, true, x - 65, y - 65); // Bounce left off ceiling.
						else addMoveToButton(3, x - 130, y - 130, -10, 1.2); // Up and to the left 2 squares.
					}
					else
					{
						if (isInRowOrColumn(row9)) addMoveToButton(3, x - 130, y, -2, .6, true, x - 65, y + 65); // Bounce left off floor.
						else addMoveToButton(3, x - 130, y + 130, 6, 1.2); // Down and to the left 2 squares.
					}
				}
			}
		}
		
		private function createRightMoveToButton():void
		{
			if (!isInRowOrColumn(column4))
			{
				if (isInRowOrColumn(column3))
				{
					if (isMovingUp)
					{
						if (currentSpace != 6) addMoveToButton(1, x, y - 130, -8, .6, true, x + 65, y - 65); // Bounce upward off right wall.
						else addMoveToButton(1, x, y, 0, .6, true, x + 65, y - 65); // Bounce off top right corner & back to same space.
					}
					else
					{
						if (currentSpace != 34) addMoveToButton(1, x, y + 130, 8, .6, true, x + 65, y + 65); // Bounce downward off right wall.
						else addMoveToButton(1, x, y, 0, .6, true, x + 65, y + 65); // Bounce off bottom right corner & back to same space.
					}
				}
				else // GamePiece is in column 1 or 2
				{
					if (isMovingUp)
					{
						if (isInRowOrColumn(row2)) addMoveToButton(1, x + 130, y, 2, .6, true, x + 65, y - 65); // Bounce right off ceiling.
						else addMoveToButton(1, x + 130, y - 130, -6, 1.2); // Up and to the right 2 squares.
					}
					else
					{
						if (isInRowOrColumn(row9)) addMoveToButton(1, x + 130, y, 2, .6, true, x + 65, y + 65); // Bounce right off floor.
						else addMoveToButton(1, x + 130, y + 130, 10, 1.2); // Down and to the right 2 squares.
					}
				}
			}
		}
		
	}

}