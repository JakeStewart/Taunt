package gui 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DebugButton1 extends Button 
	{
		private var img:Image = new Image(Images.GREENDOTWHITEHOVER);
		
		
		
		public function DebugButton1(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 1) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = img;
			hover = img;
			down = img;
			
			epSetHitBox(64, 64);
			setHitboxTo(img);
			x = 780;
			y = 574;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			graphic = img;
		}
		
		override public function click():void 
		{
			super.click();
			
			
			showGamePieceNames();
			// showSpaceOccupation();
		}
		// -------------------------------------------------------------
		
		private function showGamePieceNames():void
		{
			for (var i:uint = 0; i < 18; i++)
			{
				trace(gm.gamePieces[i].name);
			}
			
			trace("------------");
		}
		
		private function showSpaceOccupation():void
		{
			for (var j:uint = 0; j < 40; j++)
			{
				trace((j + 1).toString() + ". " + gm.squareOccupation[j]);
				if ((j + 1) % 4 == 0) trace("------");
			}
			
			trace(" ");
			trace(" ");
			trace(" ");
		}
		
	}

}