package gui.menu 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	import gui.GUI_Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class ExampleMovesButton extends GUI_Button 
	{
		private var menu:Menu;
		
		
		
		public function ExampleMovesButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.EXAMPLEMOVESBUTTONNORMAL);
			hover = new Image(Images.EXAMPLEMOVESBUTTONHOVER);
			down = normal;
			
			x = 840, y = 502;
			epSetHitbox(155, 16);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			menu = world.getInstance(Game.NAME_Menu) as Menu;
			collidableStates.push(gm.MENU);
		}
		// -------------------------------------------------------------
		
		override public function click():void 
		{
			super.click();
			
			
			menu.changeMenuPage(1);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}