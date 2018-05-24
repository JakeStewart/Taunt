package gui.reset_game 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import gui.GUI_Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class NoButton extends GUI_Button 
	{
		private var resetGame:ResetGame;
		
		
		
		public function NoButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.NONORMAL);
			hover = new Image(Images.NOHOVER);
			down = normal;
			
			epSetHitbox(32, 20, -541, -403);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			resetGame = world.getInstance(Game.NAME_ResetGame) as ResetGame;
			collidableStates.push(gm.ASKRESET);
		}
		
		override public function click():void 
		{
			super.click();
			
			
			resetGame.cancelReset();
		}
		
	}

}