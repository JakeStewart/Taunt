package 
{
	import flash.display.Stage;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import net.jacob_stewart.Keys;
	
	// This is the place code needs to be changed to 
	// set the desired resolution; 1024 x 768 or 800 x 600
	// [SWF(width = "1024", height = "768")] // Default resolution
	[SWF(width = "800", height = "600")] // Alternate resolution
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(Game.RES_WIDTH_DEF, Game.RES_HEIGHT_DEF);
		}
		
		override public function init():void
		{
			super.init();
			
			
			if (stage.stageWidth == Game.RES_WIDTH_ALT)
			{
				FP.screen.scale = Game.RES_WIDTH_ALT / FP.width; // 800 / 1024 = .78125
				FP.screen.smoothing = true;
			}
			
			Keys.defineKeys();
			FP.world = new GameWorld;
			FP.console.enable();
			FP.console.visible = false;
		}
		// ------------------------------------------------------------------
		
		
		
		// ------------------------------------------------------------------
		
		
		
		// ------------------------------------------------------------------
		
	}
	
}