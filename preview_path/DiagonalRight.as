package preview_path 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DiagonalRight extends PreviewPathSegment 
	{
		
		public function DiagonalRight() 
		{
			super();
			
		}
		
		override public function init():void 
		{
			shortImg = new Image(Images.DIAGONALRIGHTTOPSHORT);
			longImg = new Image(Images.DIAGONALRIGHTTOPLONG);
			baseAlpha = lineBaseAlpha;
			
			super.init();
			
			layer = -1;
		}
		
	}

}