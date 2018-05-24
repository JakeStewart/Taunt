package game_piece 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import preview_path.DotDestination;
	import preview_path.Horizontal;
	import preview_path.VerticalShort;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Dot extends GamePiece 
	{
		
		public function Dot(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = -4) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			blackImg = new Image(Images.DOTBLACK);
			whiteImg = new Image(Images.DOTWHITE);
			
			
			super.init();
			
			
			subType1 = "Dot";
		}
		// -------------------------------------------------------------
		
		override public function createPaths():void 
		{
			super.createPaths();
			
			
			if (!isInRowOrColumn(row1)) // Up
			{
				if (!isOnSameTeam( -4))
				{
					addDirection(0, VerticalShort, DotDestination, 0, -65, 0, -65);
					addMoveToButton(0, x, y - 65, -4, 1);
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
			
			if (!isInRowOrColumn(row10)) // Down
			{
				if (!isOnSameTeam(4))
				{
					addDirection(2, VerticalShort, DotDestination, 0, 0, 0, 65);
					addMoveToButton(2, x, y + 65, 4, 1);
				}
			}
			
			if (!isInRowOrColumn(column1)) // Left
			{
				if (!isOnSameTeam( -1))
				{
					addDirection(3, Horizontal, DotDestination, -65, 0, -65, 0);
					addMoveToButton(3, x - 65, y, -1, 1);
				}
			}
		}
		
	}

}