package  
{
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Sounds 
	{
		[Embed(source = "../assets/sounds/Move_over_game_piece.mp3")] public static const MOUSEOVERGAMEPIECE:Class;
		public static var mouseOverGamePiece:Sfx = new Sfx(MOUSEOVERGAMEPIECE);
		
		[Embed(source = "../assets/sounds/Menu_button_click.mp3")] public static const MENUBUTTONCLICK:Class;
		public static var menuButtonClick:Sfx = new Sfx(MENUBUTTONCLICK);
		
		[Embed(source = "../assets/sounds/Exit_menu.mp3")] public static const EXITMENU:Class;
		[Embed(source = "../assets/sounds/Game_start.mp3")] public static const GAMESTART:Class;
		public static var winner:Sfx = new Sfx(GAMESTART);
		
	}

}