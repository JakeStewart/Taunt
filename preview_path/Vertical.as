package preview_path 
{
	import net.flashpunk.graphics.Image;
	
	import preview_path.PreviewPathSegment;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Vertical extends PreviewPathSegment
	{
		
		public function Vertical() 
		{
			super();
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.VERTICALTOPSHORT);
			longImg = new Image(Images.VERTICALTOPLONG);
			baseAlpha = lineBaseAlpha;
			
			super.init();
			
			layer = -1;
		}
		
	}

}