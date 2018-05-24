package gui.menu 
{
	import flash.system.fscommand;
	
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import gui.GUI_Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class QuitButton extends GUI_Button 
	{
		
		public function QuitButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.QUITBUTTONNORMAL);
			hover = new Image(Images.QUITBUTTONHOVER);
			down = normal;
			
			x = 840, y = 604;
			epSetHitbox(39, 19);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			collidableStates.push(gm.MENU);
		}
		
		override public function click():void 
		{
			super.click();
			
			
			fscommand("quit");
		}
		
	}

}