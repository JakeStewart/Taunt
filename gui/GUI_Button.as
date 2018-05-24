package gui 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	import net.jacob_stewart.Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GUI_Button extends Button 
	{
		public var gm:GameManager;
		public var ui:GUI_Manager;
		
		public var normal:Image;
		public var hover:Image;
		public var down:Image;
		
		public var collidableStates:Array = new Array;
		
		
		
		public function GUI_Button(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = -15) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			gm = world.getInstance(Game.NAME_GameManager) as GameManager;
			ui = world.getInstance(Game.NAME_GUI_Manager) as GUI_Manager;
		}
		// -------------------------------------------------------------
		
		override public function update():void 
		{
			updateCollidable();
			super.update();
		}
		
		public function updateCollidable():void
		{
			epCollidable(false);
			if (collidableStates.indexOf(gm.state) != -1) epCollidable(true);
		}
		// -------------------------------------------------------------
		
		override public function click():void 
		{
			Sounds.menuButtonClick.play();
			super.click();
		}
		// -------------------------------------------------------------
		
		
		override public function changeStateNormal():void 
		{
			super.changeStateNormal();
			graphic = normal;
		}
		
		override public function changeStateHover():void 
		{
			super.changeStateHover();
			graphic = hover;
		}
		
		override public function changeStateDown():void 
		{
			super.changeStateDown();
			graphic = down;
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}