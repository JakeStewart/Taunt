package gui.menu 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	import gui.GUI_Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class MenuButton extends GUI_Button 
	{
		private var visibleStates:Array = new Array;
		
		
		
		public function MenuButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = Game.GUIBUTTON_LAYER) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.MENUNORMAL);
			hover = new Image(Images.MENUHOVER);
			down = normal;
			
			epSetHitbox(52, 16, -1);
			x = 873, y = 695;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			visibleStates.push(gm.MENU, gm.IDLE_GREEN, gm.IDLE_ORANGE);
			collidableStates.push(gm.MENU, gm.IDLE_GREEN, gm.IDLE_ORANGE);
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			super.update();
			updateVisible();
		}
		
		override public function click():void 
		{
			super.click();
			ui.toggleMenu();
		}
		
		private function updateVisible():void
		{
			epVisible(false);
			if (visibleStates.indexOf(gm.state) != -1) epVisible(true);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}