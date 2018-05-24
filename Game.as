package  
{
	import net.flashpunk.FP;
	
	import game_piece.Dot;
	import game_piece.Lightning;
	import game_piece.X;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Game 
	{
		public static const RES_WIDTH_DEF:uint = 1024;
		public static const RES_HEIGHT_DEF:uint = 768;
		public static const RES_WIDTH_ALT:uint = 800;
		public static const RES_HEIGHT_ALT:uint = 600;
		
		public static const GUIBUTTON_LAYER:int = -15;
		
		
		/* TYPE & NAME STRINGS */
		public static const TYPE_GameManager:String = "GameManager";
		
		public static const NAME_GameManager:String = "GameManager";
		public static const NAME_GUI_Manager:String = "GUI_Manager";
		public static const NAME_Menu:String = "Menu";
		public static const NAME_ResetGame:String = "ResetGame";
		// ---------------------------------------------------------------------------------------------------------
		
		
		public static const ORANGE:String = "orange";
		public static const GREEN:String = "green";
		public static const EMPTY:String = "empty";
		public static const NONE:String = "none";
		// ---------------------------------------------------------------------------------------------------------
		
		
		public static const PLAYER_COUNT:uint = 2;
		
		public static const COLUMN_COUNT:uint = 4;
		public static const ROW_COUNT:uint = 10;
		public static const SPACE_COUNT:uint = COLUMN_COUNT * ROW_COUNT;
		
		public static const GP_CLASSES:Array = [Dot, Lightning, X];
		public static const GP_TYPE_COUNT:uint = 3;
		public static const GP_COUNT:uint = (GP_CLASSES.length * GP_TYPE_COUNT) * PLAYER_COUNT;
		public static const PLAYER_GP_COUNT:uint = GP_CLASSES.length * GP_TYPE_COUNT;
		// ---------------------------------------------------------------------------------------------------------
		
		
		private static const SECONDS_ACROSS_SCREEN:Number = 2.5; // The time (in seconds) it takes to move FP.width
		// (FP.width / SECONDS_ACROSS_SCREEN): Length traveled per second
		// (FP.width / SECONDS_ACROSS_SCREEN) / FP.assignedFrameRate: Length traveled per frame
		public static function get moveRate():Number { return (FP.width / SECONDS_ACROSS_SCREEN) / FP.assignedFrameRate; }
		
		public static function duration(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return (FP.distance(x1, y1, x2, y2) / moveRate) / FP.assignedFrameRate;
		}
		// ---------------------------------------------------------------------------------------------------------
		
		
		
		// ---------------------------------------------------------------------------------------------------------
		
		
		
		// ---------------------------------------------------------------------------------------------------------
		
	}

}