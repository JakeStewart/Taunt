package game_piece 
{
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GamePieceHitBox2 extends EntityGame 
	{
		private var parent:GamePiece;
		private var gp:GamePiece;
		public var gamePieceNum:uint;
		public var opponentColor:String;
		private var opponentHB:GamePieceHitBox2;
		
		
		
		public function GamePieceHitBox2(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			parent = gm.gamePieces[gamePieceNum];
		}
		
		override public function update():void 
		{
			super.update();
			
			
			checkCollideOpponent();
		}
		
		private function checkCollideOpponent():void
		{
			if (parent.isMovingSpaces)
			{
				setHitbox(36, 36, -14, -14);
				
				opponentHB = collide(opponentColor, x, y) as GamePieceHitBox2;
				
				if (opponentHB)
				{
					gp = gm.gamePieces[opponentHB.gamePieceNum];
					if (!gp.isTaken) gp.taken();
				}
			}
			else setHitbox(10, 10, -27, -27);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}