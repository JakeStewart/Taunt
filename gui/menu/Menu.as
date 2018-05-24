package gui.menu 
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import net.jacob_stewart.Keys;
	
	import gui.GUI_Manager;
	import gui.reset_game.ResetGameButton;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Menu extends EntityGame 
	{
		private var ui:GUI_Manager;
		private var backupState:uint;
		
		private var menuBackground:EntityGame = new EntityGame(0, 0, Images.menuBackground, -18);
		private var rules:EntityGame = new EntityGame(0, 0, Images.rules, -19);
		private var exampleMoves:EntityGame = new EntityGame(0, 0, Images.exampleMoves, -19);
		private var rulesBtn:RulesButton = new RulesButton(0, 0, null, Game.GUIBUTTON_LAYER);
		private var exampleMovesBtn:ExampleMovesButton = new ExampleMovesButton(0, 0, null, Game.GUIBUTTON_LAYER);
		private var resetGameBtn:ResetGameButton = new ResetGameButton(0, 0, null, Game.GUIBUTTON_LAYER);
		private var quitBtn:QuitButton = new QuitButton(0, 0, null, Game.GUIBUTTON_LAYER);
		
		
		
		public function Menu() 
		{
			super();
		}
		
		override public function init():void 
		{
			super.init();
			
			
			name = Game.NAME_Menu;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			ui = world.getInstance(Game.NAME_GUI_Manager) as GUI_Manager;
			backupState = gm.state;
			gm.state = gm.MENU;
			ui.tweenScreenTint(.6, 0);
			
			children.push(menuBackground, rules, rulesBtn, exampleMovesBtn, resetGameBtn);
			epAddList(children);
		}
		
		override public function removed():void
		{
			super.removed();
			
			
			gm.state = backupState;
			ui.tweenScreenTint(0, 1);
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			checkPageChange();
		}
		
		private function checkPageChange():void
		{
			if (Input.pressed(Keys.DIR)) changeMenuPage();
		}
		
		public function changeMenuPage(page:int = -1):void
		{
			if (page == -1)
			{
				if (exampleMoves.world) page = 0;
				else page = 1;
			}
			
			switch(page)
			{
				case 0: // Turn on rules page
					
					epRemove(exampleMoves);
					epAdd(rules);
					
					break;
				case 1: // Turn on example moves page
					
					epRemove(rules);
					epAdd(exampleMoves);
					
					break;
			}
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}