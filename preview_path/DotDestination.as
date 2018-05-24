package preview_path 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DotDestination extends PreviewPathSegment 
	{
		
		public function DotDestination() 
		{
			super();
			
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.DOTDESTINATION);
			longImg = new Image(Images.DOTDESTINATION);
			baseAlpha = dotBaseAlpha;
			
			super.init();
			
			layer = -2;
		}
		
	}

}