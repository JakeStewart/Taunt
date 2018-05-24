package gui.reset_game 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import gui.GUI_Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class ResetGameButton extends GUI_Button 
	{
		
		public function ResetGameButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.RESETBUTTONNORMAL);
			hover = new Image(Images.RESETBUTTONHOVER);
			down = normal;
			
			x = 840, y = 554;
			epSetHitbox(122, 16);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			collidableStates.push(gm.MENU);
		}
		
		override public function click():void 
		{
			super.click();
			
			
			ui.addResetGame();
		}
		
	}

}