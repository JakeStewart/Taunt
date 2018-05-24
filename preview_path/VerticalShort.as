package preview_path 
{
	import net.flashpunk.graphics.Image;
	
	import preview_path.PreviewPathSegment;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class VerticalShort extends PreviewPathSegment
	{
		
		public function VerticalShort() 
		{
			super();
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.VERTICALSHORTSHORT);
			longImg = new Image(Images.VERTICALSHORTSHORT);
			baseAlpha = lineBaseAlpha;
			
			super.init();
			
			layer = -1;
		}
		
	}

}