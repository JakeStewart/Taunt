package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GameWorld extends World 
	{
		
		public function GameWorld() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			
			add(new GameManager);
		}
		
		override public function update():void 
		{
			super.update();
			
			
			toggleMute();
			toggleConsole();
			// debug();
		}
		
		private function toggleMute():void
		{
			if (Input.pressed(Key.M))
			{
				// SaveFileData.toggleMute();
			}
		}
		
		private function toggleConsole():void
		{
			if (Input.pressed(Key.F12))
			{
				if (FP.console.visible) FP.console.visible = false;
				else FP.console.visible = true;
			}
		}
		// ---------------------------------------------------------------------------------------------------------
		
		
		private function debug():void
		{
			if (Input.pressed(Key.T)) debug1();
		}
		
		private function debug1():void
		{
			
		}
		// ---------------------------------------------------------------------------------------------------------
		
		
		
		// ---------------------------------------------------------------------------------------------------------
		
	}

}