package game_piece 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import preview_path.DotDestination;
	import preview_path.DotMidway;
	import preview_path.Horizontal;
	import preview_path.Vertical;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Lightning extends GamePiece 
	{
		
		public function Lightning(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = -4) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			blackImg = new Image(Images.LIGHTNINGBLACK);
			whiteImg = new Image(Images.LIGHTNINGWHITE);
			
			
			super.init();
			
			
			subType1 = "Lightning";
		}
		// -------------------------------------------------------------
		
		override public function createPaths():void 
		{
			super.createPaths();
			
			
			// Determine the board space difference for the forward move.
			if (isMovingUp)
			{
				if (isInRowOrColumn(row2)) spaceDiff = 0;
				else spaceDiff = -8;
			}
			else
			{
				if (isInRowOrColumn(row9)) spaceDiff = 0;
				else spaceDiff = 8;
			}
			
			// Add left and right paths
			if (!isInRowOrColumn(column1)) // Left
			{
				if (!isOnSameTeam( -1))
				{
					addDirection(3, Horizontal, DotDestination, -65, 0, -65, 0);
					addMoveToButton(3, x - 65, y, -1, 1);
				}
			}
			
			if (!isInRowOrColumn(column4)) // Right
			{
				if (!isOnSameTeam(1))
				{
					addDirection(1, Horizontal, DotDestination, 0, 0, 65, 0);
					addMoveToButton(1, x + 65, y, 1, 1);
				}
			}
			
			// Add forward paths:
			if (!isOnSameTeam(spaceDiff))
			{
				// First line
				if (isMovingUp) addDirection(0, Vertical, DotMidway, 0, -65, 0, -65, true);
				else addDirection(2, Vertical, DotMidway, 0, 0, 0, 65);
				
				// Second line
				if (isMovingUp)
				{
					if (!isInRowOrColumn(row2))
					{
						addDirection(0, Vertical, DotDestination, 0, -130, 0, -130);
						addMoveToButton(0, x, y - 130, -8, 1.2);
					}
					else addMoveToButton(0, x, y, 0, .6, true, x, y - 65); // Will bounce off ceiling
				}
				else
				{
					if (!isInRowOrColumn(row9))
					{
						addDirection(2, Vertical, DotDestination, 0, 65, 0, 130, true);
						addMoveToButton(2, x, y + 130, 8, 1.2);
					}
					else addMoveToButton(2, x, y, 0, .6, true, x, y + 65); // Will bounce off floor
				}
			}
		}
		
	}

}