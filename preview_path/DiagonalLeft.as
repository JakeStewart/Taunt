package preview_path 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DiagonalLeft extends PreviewPathSegment 
	{
		
		public function DiagonalLeft() 
		{
			super();
			
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.DIAGONALLEFTTOPSHORT);
			longImg = new Image(Images.DIAGONALLEFTTOPLONG);
			baseAlpha = lineBaseAlpha;
			
			super.init();
			
			layer = -1;
		}
		
	}

}