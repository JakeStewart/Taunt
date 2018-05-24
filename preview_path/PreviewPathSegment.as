package preview_path 
{
	import EntityGame;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	import game_piece.GamePiece;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class PreviewPathSegment extends EntityGame
	{
		private var gp:GamePiece;
		
		public var shortImg:Image;
		public var longImg:Image;
		public var imgUsed:Image;
		
		public var lineBaseAlpha:Number = .5;
		public var dotBaseAlpha:Number = 1;
		public var baseAlpha:Number;
		public var currentAlpha:Number;
		
		public var gamePieceNum:uint;
		
		
		
		public function PreviewPathSegment() 
		{
			super();
		}
		
		override public function init():void 
		{
			super.init();
			
			
			shortImg.alpha = baseAlpha;
			longImg.alpha = baseAlpha;
			currentAlpha = baseAlpha;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			gp = gm.gamePieces[gamePieceNum];
		}
		
		override public function update():void 
		{
			super.update();
			
			
			updateCurrentAlpha();
			updateVisible();
		}
		
		private function updateCurrentAlpha():void
		{
			gp = gm.gamePieces[gamePieceNum];
			
			if (gm.state != gm.MOVING)
			{
				currentAlpha = baseAlpha;
				if (gp.gamePieceColor == gm.playerTurn && (gm.gamePieceNumPendingMove != gm.NO_GAMEPIECE_PENDINGMOVE_NUM && gm.gamePieceNumPendingMove != gamePieceNum)) currentAlpha = baseAlpha - (baseAlpha * .5);
				
				imgUsed.alpha = currentAlpha;
			}
		}
		
		private function updateVisible():void
		{
			visible = false;
			if (gp.gamePieceColor == gm.playerTurn && (gp.graphic as Graphiclist).children.indexOf(gp.hover) != -1) visible = true;
		}
		// -------------------------------------------------------------
		
		public function chooseImg(bool:Boolean):void
		{
			if (bool) imgUsed = longImg;
			else imgUsed = shortImg;
			graphic = imgUsed;
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}