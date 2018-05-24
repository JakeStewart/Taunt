package gui 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class NewGameButton extends GUI_Button 
	{
		private var gameStartSfx:Sfx = new Sfx(Sounds.GAMESTART);
		private var visibileStates:Array = new Array;
		
		
		
		public function NewGameButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = -15) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.NEWGAMENORMAL);
			hover = new Image(Images.NEWGAMETEXT);
			down = normal;
			
			epSetHitbox(234, 35, -395, -332);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			collidableStates.push(gm.WINNER);
			visibileStates.push(gm.WINNER);
		}
		
		override public function click():void 
		{
			super.click();
			// gameStartSfx.play();
			gm.createNewGame();
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			super.update();
			updateVisible();
		}
		
		private function updateVisible():void
		{
			epVisible(false);
			if (visibileStates.indexOf(gm.state) != -1) epVisible(true);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}