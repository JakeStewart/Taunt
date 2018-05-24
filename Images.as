package  
{
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Images 
	{
		[Embed(source = "../assets/images/Background_01.png")] public static const BACKGROUND1:Class;
		public static var background:Image = new Image(BACKGROUND1);
		
		[Embed(source = "../assets/images/Screen_tint_01.png")] public static const SCREENTINT1:Class;
		public static var screenTint:Image = new Image(SCREENTINT1);
		
		[Embed(source = "../assets/images/Game_title_01.png")] public static const GAMETITLE:Class;
		public static var gameTitle1:Image = new Image(GAMETITLE);
		
		[Embed(source = "../assets/images/Game_title_02.png")] public static const GAMETITLE2:Class;
		public static var gameTitle2:Image = new Image(GAMETITLE2);
		
		[Embed(source = "../assets/images/Menu_Background.png")] public static const MENUBACKGROUND:Class;
		public static var menuBackground:Image = new Image(MENUBACKGROUND);
		
		[Embed(source = "../assets/images/Rules_Background1.png")] public static const RULESBACKGROUND:Class;
		
		[Embed(source = "../assets/images/Rules_01.png")] public static const RULES:Class;
		public static var rules:Image = new Image(RULES);
		
		[Embed(source = "../assets/images/Example_moves_01.png")] public static const EXAMPLEMOVES:Class;
		public static var exampleMoves:Image = new Image(EXAMPLEMOVES);
		
		// Player titles
		[Embed(source = "../assets/images/Player_title_Green.png")] public static const PLAYERTITLEGREEN:Class;
		public static var greenTitle:Image = new Image(PLAYERTITLEGREEN);
		
		[Embed(source = "../assets/images/Player_title_Orange.png")] public static const PLAYERTITLEORANGE:Class;
		public static var orangeTitle:Image = new Image(PLAYERTITLEORANGE);
		
		// GUI
		[Embed(source = "../assets/images/Directional_arrow_01.png")] public static const DIRECTIONALARROW:Class;
		[Embed(source = "../assets/images/Directional_arrow_01_Down.png")] public static const DIRECTIONALARROWDOWN:Class;
		[Embed(source = "../assets/images/New_game_Text.png")] public static const NEWGAMETEXT:Class;
		[Embed(source = "../assets/images/New_game_Normal.png")] public static const NEWGAMENORMAL:Class;
		[Embed(source = "../assets/images/GUI/Menu_button_Normal.png")] public static const MENUNORMAL:Class;
		[Embed(source = "../assets/images/GUI/Menu_button_Hover.png")] public static const MENUHOVER:Class;
		
		[Embed(source = "../assets/images/Reset_Rules_Divider.png")] public static const RESETRULESDIVIDER:Class;
		public static var resetRulesDivider:Image = new Image(RESETRULESDIVIDER);
		
		[Embed(source = "../assets/images/Reset_Button_Normal.png")] public static const RESETBUTTONNORMAL:Class;
		[Embed(source = "../assets/images/Reset_Button_Hover.png")] public static const RESETBUTTONHOVER:Class;
		[Embed(source = "../assets/images/Rules_Button_Normal.png")] public static const RULESBUTTONNORMAL:Class;
		[Embed(source = "../assets/images/Rules_Button_Hover.png")] public static const RULESBUTTONHOVER:Class;
		[Embed(source = "../assets/images/Rules_Button2_Normal.png")] public static const RULESBUTTON2NORMAL:Class;
		[Embed(source = "../assets/images/Rules_Button2_Hover.png")] public static const RULESBUTTON2HOVER:Class;
		[Embed(source = "../assets/images/Quit_Button_Normal.png")] public static const QUITBUTTONNORMAL:Class;
		[Embed(source = "../assets/images/Quit_Button_Hover.png")] public static const QUITBUTTONHOVER:Class;
		
		[Embed(source = "../assets/images/Are_you_sure.png")] public static const AREYOUSURE:Class;
		public static var areYouSure:Image = new Image(AREYOUSURE);
		
		[Embed(source = "../assets/images/Yes_Normal.png")] public static const YESNORMAL:Class;
		[Embed(source = "../assets/images/Yes_Hover.png")] public static const YESHOVER:Class;
		[Embed(source = "../assets/images/No_Normal.png")] public static const NONORMAL:Class;
		[Embed(source = "../assets/images/No_Hover.png")] public static const NOHOVER:Class;
		[Embed(source = "../assets/images/Example_moves_button_Normal.png")] public static const EXAMPLEMOVESBUTTONNORMAL:Class;
		[Embed(source = "../assets/images/Example_moves_button_Hover.png")] public static const EXAMPLEMOVESBUTTONHOVER:Class;
		[Embed(source = "../assets/images/Exit_button_Normal.png")] public static const EXITBUTTONNORMAL:Class;
		[Embed(source = "../assets/images/Exit_button_Hover.png")] public static const EXITBUTTONHOVER:Class;
		
		// Win text
		[Embed(source = "../assets/images/Green_wins.png")] public static const GREENWINS:Class;
		public static var greenWins:Image = new Image(GREENWINS);
		
		[Embed(source = "../assets/images/Orange_wins.png")] public static const ORANGEWINS:Class;
		public static var orangeWins:Image = new Image(ORANGEWINS);
		
		// Game pieces
		[Embed(source = "../assets/images/Game_piece_shadow_01.png")] public static const GAMEPIECESHADOW1:Class;
		[Embed(source = "../assets/images/Game_piece_shadow_02.png")] public static const GAMEPIECESHADOW2:Class;
		
		[Embed(source = "../assets/images/Dot_Green_Black_Normal.png")] public static const GREENDOTBLACKNORMAL:Class;
		[Embed(source = "../assets/images/Dot_Green_Black_Hover.png")] public static const GREENDOTBLACKHOVER:Class;
		[Embed(source = "../assets/images/Dot_Green_White_Normal.png")] public static const GREENDOTWHITENORMAL:Class;
		[Embed(source = "../assets/images/Dot_Green_White_Hover.png")] public static const GREENDOTWHITEHOVER:Class;
		
		[Embed(source = "../assets/images/Lightning_Green_Black_Normal.png")] public static const GREENLIGHTNINGBLACKNORMAL:Class;
		[Embed(source = "../assets/images/Lightning_Green_Black_Hover.png")] public static const GREENLIGHTNINGBLACKHOVER:Class;
		[Embed(source = "../assets/images/Lightning_Green_White_Normal.png")] public static const GREENLIGHTNINGWHITENORMAL:Class;
		[Embed(source = "../assets/images/Lightning_Green_White_Hover.png")] public static const GREENLIGHTNINGWHITEHOVER:Class;
		
		[Embed(source = "../assets/images/X_Green_Black_Normal.png")] public static const GREENXBLACKNORMAL:Class;
		[Embed(source = "../assets/images/X_Green_Black_Hover.png")] public static const GREENXBLACKHOVER:Class;
		[Embed(source = "../assets/images/X_Green_White_Normal.png")] public static const GREENXWHITENORMAL:Class;
		[Embed(source = "../assets/images/X_Green_White_Hover.png")] public static const GREENXWHITEHOVER:Class;
		
		[Embed(source = "../assets/images/Dot_Orange_Black_Normal.png")] public static const ORANGEDOTBLACKNORMAL:Class;
		[Embed(source = "../assets/images/Dot_Orange_Black_Hover.png")] public static const ORANGEDOTBLACKHOVER:Class;
		[Embed(source = "../assets/images/Dot_Orange_White_Normal.png")] public static const ORANGEDOTWHITENORMAL:Class;
		[Embed(source = "../assets/images/Dot_Orange_White_Hover.png")] public static const ORANGEDOTWHITEHOVER:Class;
		
		[Embed(source = "../assets/images/Lightning_Orange_Black_Normal.png")] public static const ORANGELIGHTNINGBLACKNORMAL:Class;
		[Embed(source = "../assets/images/Lightning_Orange_Black_Hover.png")] public static const ORANGELIGHTNINGBLACKHOVER:Class;
		[Embed(source = "../assets/images/Lightning_Orange_White_Normal.png")] public static const ORANGELIGHTNINGWHITENORMAL:Class;
		[Embed(source = "../assets/images/Lightning_Orange_White_Hover.png")] public static const ORANGELIGHTNINGWHITEHOVER:Class;
		
		[Embed(source = "../assets/images/X_Orange_Black_Normal.png")] public static const ORANGEXBLACKNORMAL:Class;
		[Embed(source = "../assets/images/X_Orange_Black_Hover.png")] public static const ORANGEXBLACKHOVER:Class;
		[Embed(source = "../assets/images/X_Orange_White_Normal.png")] public static const ORANGEXWHITENORMAL:Class;
		[Embed(source = "../assets/images/X_Orange_White_Hover.png")] public static const ORANGEXWHITEHOVER:Class;
		
		[Embed(source = "../assets/images/Dot_Black.png")] public static const DOTBLACK:Class;
		[Embed(source = "../assets/images/Dot_White.png")] public static const DOTWHITE:Class;
		[Embed(source = "../assets/images/Lightning_Black.png")] public static const LIGHTNINGBLACK:Class;
		[Embed(source = "../assets/images/Lightning_White.png")] public static const LIGHTNINGWHITE:Class;
		[Embed(source = "../assets/images/X_Black.png")] public static const XBLACK:Class;
		[Embed(source = "../assets/images/X_White.png")] public static const XWHITE:Class;
		
		[Embed(source = "../assets/images/Green_Opponents_turn.png")] public static const GREENOPPSTURN:Class;
		[Embed(source = "../assets/images/Green_Normal.png")] public static const GREENNORMAL:Class;
		[Embed(source = "../assets/images/Green_Hover.png")] public static const GREENHOVER:Class;
		[Embed(source = "../assets/images/Orange_Opponents_turn.png")] public static const ORANGEOPPSTURN:Class;
		[Embed(source = "../assets/images/Orange_Normal.png")] public static const ORANGENORMAL:Class;
		[Embed(source = "../assets/images/Orange_Hover.png")] public static const ORANGEHOVER:Class;
		
		// Preview path
		[Embed(source = "../assets/images/Preview_path/Square_highlight.png")] public static const SQUAREHIGHLIGHT:Class;
		[Embed(source = "../assets/images/Preview_path/Dot_Midway.png")] public static const DOTMIDWAY:Class;
		[Embed(source = "../assets/images/Preview_path/Dot_Destination.png")] public static const DOTDESTINATION:Class;
		[Embed(source = "../assets/images/Preview_path/Horizontal.png")] public static const HORIZONTAL:Class;
		[Embed(source = "../assets/images/Preview_path/Vertical_Top_short.png")] public static const VERTICALTOPSHORT:Class;
		[Embed(source = "../assets/images/Preview_path/Vertical_Top_long.png")] public static const VERTICALTOPLONG:Class;
		[Embed(source = "../assets/images/Preview_path/Vertical_short_short.png")] public static const VERTICALSHORTSHORT:Class;
		[Embed(source = "../assets/images/Preview_path/Diagonal_left_Top_short.png")] public static const DIAGONALLEFTTOPSHORT:Class;
		[Embed(source = "../assets/images/Preview_path/Diagonal_left_Top_long.png")] public static const DIAGONALLEFTTOPLONG:Class;
		[Embed(source = "../assets/images/Preview_path/Diagonal_right_Top_short.png")] public static const DIAGONALRIGHTTOPSHORT:Class;
		[Embed(source = "../assets/images/Preview_path/Diagonal_right_Top_long.png")] public static const DIAGONALRIGHTTOPLONG:Class;
		
	}

}