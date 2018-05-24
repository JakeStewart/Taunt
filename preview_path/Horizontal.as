package preview_path 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Horizontal extends PreviewPathSegment 
	{
		
		public function Horizontal() 
		{
			super();
			
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.HORIZONTAL);
			longImg = new Image(Images.HORIZONTAL);
			baseAlpha = lineBaseAlpha;
			
			super.init();
			
			layer = -1;
		}
		
	}

}