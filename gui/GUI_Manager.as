package gui 
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import net.jacob_stewart.JS;
	
	import gui.menu.Menu;
	import gui.menu.MenuButton;
	import gui.reset_game.ResetGame;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GUI_Manager extends EntityGame 
	{
		private const PLAYERTITLE_ALPHALOW:Number = .4;
		private const WIN_IMG_Y:Number = 200;
		
		private var background1:EntityGame = new EntityGame(0, 0, Images.background, 0);
		private var screenTint:EntityGame = new EntityGame(0, 0, Images.screenTint, -14);
		private var gameTitle1:EntityGame = new EntityGame(0, 0, Images.gameTitle1, -16);
		private var gameTitle2:EntityGame = new EntityGame(0, 0, Images.gameTitle2, -17);
		private var greenTitle:EntityGame = new EntityGame(0, 0, Images.greenTitle, -13);
		private var orangeTitle:EntityGame = new EntityGame(0, 0, Images.orangeTitle, -13);
		private var greenWins:EntityGame = new EntityGame(0, WIN_IMG_Y, Images.greenWins, -15);
		private var orangeWins:EntityGame = new EntityGame(0, WIN_IMG_Y, Images.orangeWins, -15);
		
		private var newGameBtn:NewGameButton = new NewGameButton(0, 0, null, Game.GUIBUTTON_LAYER);
		
		private var menuBtn:MenuButton = new MenuButton;
		private var menu:Menu = new Menu;
		private var resetGame:ResetGame = new ResetGame;
		
		private var toggleMenuStates:Array = new Array;
		private var screenTintTweens:Array = new Array;
		
		
		
		public function GUI_Manager() 
		{
			super();
		}
		
		override public function init():void 
		{
			super.init();
			
			
			name = Game.NAME_GUI_Manager;
			
			Images.screenTint.alpha = .6;
			Images.gameTitle2.alpha = 0;
			Images.greenTitle.alpha = PLAYERTITLE_ALPHALOW;
			Images.orangeTitle.alpha = PLAYERTITLE_ALPHALOW;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			toggleMenuStates.push(gm.MENU, gm.IDLE_GREEN, gm.IDLE_ORANGE);
			
			children.push(background1, screenTint, gameTitle1, gameTitle2, greenTitle, orangeTitle, menuBtn);
			world.addList(children);
		}
		// -------------------------------------------------------------
		
		override public function update():void 
		{
			if (Input.pressed(Key.ESCAPE)) toggleMenu();
		}
		
		public function toggleMenu():void
		{
			if (toggleMenuStates.indexOf(gm.state) != -1)
			{
				if (gm.state != gm.MENU) world.add(menu);
				else world.remove(menu);
			}
		}
		// -------------------------------------------------------------
		
		
		public function addResetGame():void
		{
			world.remove(menu);
			world.add(resetGame);
		}
		// -------------------------------------------------------------
		
		
		public function tweenScreenTint(tintAlphaTo:Number, titleAlphaTo:Number, onComplete:Function = null):void
		{
			JS.cancelTweens(screenTintTweens);
			screenTintTweens.length = 0;
			
			screenTintTweens.push
			(
				FP.tween(Images.screenTint, { alpha: tintAlphaTo }, .4, { tweener: screenTint } ), 
				FP.tween(Images.gameTitle2, { alpha: titleAlphaTo }, .4, { complete: onComplete, tweener: gameTitle2 } )
			);
		}
		// -------------------------------------------------------------
		
		
		public function createNewGame():void
		{
			if (newGameBtn.world) world.remove(newGameBtn);
			
			if (greenWins.world) world.remove(greenWins);
			else if (orangeWins.world) world.remove(orangeWins);
			
			Images.greenTitle.alpha = PLAYERTITLE_ALPHALOW;
			Images.orangeTitle.alpha = PLAYERTITLE_ALPHALOW;
		}
		
		public function switchTurns():void
		{
			if (gm.playerTurn == Game.GREEN)
			{
				Images.greenTitle.alpha = PLAYERTITLE_ALPHALOW;
				Images.orangeTitle.alpha = 1;
			}
			else
			{
				Images.greenTitle.alpha = 1;
				Images.orangeTitle.alpha = PLAYERTITLE_ALPHALOW;
			}
		}
		
		public function declareWinner():void
		{
			Images.greenTitle.alpha = PLAYERTITLE_ALPHALOW;
			Images.orangeTitle.alpha = PLAYERTITLE_ALPHALOW;
			
			tweenScreenTint(.6, 0);
			
			if (gm.playerTurn == Game.GREEN) world.add(greenWins);
			else world.add(orangeWins);
			
			FP.alarm(1, addNewGameBtn);
		}
		
		private function addNewGameBtn():void
		{
			world.add(newGameBtn);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}