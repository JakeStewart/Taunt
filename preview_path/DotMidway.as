package preview_path 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DotMidway extends PreviewPathSegment 
	{
		
		public function DotMidway() 
		{
			super();
			
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.DOTMIDWAY);
			longImg = new Image(Images.DOTMIDWAY);
			baseAlpha = dotBaseAlpha;
			
			super.init();
			
			layer = -2;
		}
		
	}

}