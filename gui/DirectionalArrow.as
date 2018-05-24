package gui 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DirectionalArrow extends EntityGame 
	{
		private var dirArrowUpImg:Image = new Image(Images.DIRECTIONALARROW);
		private var dirArrowDownImg:Image = new Image(Images.DIRECTIONALARROWDOWN);
		private var usedImg:Image;
		
		
		
		public function DirectionalArrow(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = -6) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			usedImg = dirArrowUpImg;
		}
		
		override public function update():void 
		{
			super.update();
			
			
			updateVisible();
		}
		
		private function updateVisible():void
		{
			visible = false;
			if (Input.check(Key.TAB)) visible = true;
		}
		// -------------------------------------------------------------
		
		public function setDirection(direction:uint):void
		{
			switch(direction)
			{
				case 0: // Up
					usedImg = dirArrowUpImg;
					break;
				case 1: // Down
					usedImg = dirArrowDownImg;
					break;
			}
			
			graphic = usedImg;
		}
		
	}

}