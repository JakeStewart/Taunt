package gui.reset_game 
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import gui.GUI_Manager;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class ResetGame extends EntityGame 
	{
		private var ui:GUI_Manager;
		
		private var areYouSure:EntityGame = new EntityGame(0, 0, Images.areYouSure, Game.GUIBUTTON_LAYER);
		private var yesBtn:YesButton = new YesButton(0, 0, null, Game.GUIBUTTON_LAYER);
		private var noBtn:NoButton = new NoButton(0, 0, null, Game.GUIBUTTON_LAYER);
		
		
		
		public function ResetGame() 
		{
			super();
		}
		
		override public function init():void
		{
			super.init();
			
			
			name = Game.NAME_ResetGame;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			ui = world.getInstance(Game.NAME_GUI_Manager) as GUI_Manager;
			gm.state = gm.ASKRESET;
			ui.tweenScreenTint(.6, 0);
			
			children.push(areYouSure, yesBtn, noBtn);
			epAddList(children);
		}
		// -------------------------------------------------------------
		
		
		override public function update():void
		{
			super.update();
			
			
			if (Input.pressed(Key.ESCAPE)) cancelReset();
		}
		// -------------------------------------------------------------
		
		
		public function confirmReset():void
		{
			gm.resetGame();
			world.remove(this);
		}
		
		public function cancelReset():void
		{
			if (gm.playerTurn == Game.GREEN) gm.state = gm.IDLE_GREEN;
			else gm.state = gm.IDLE_ORANGE;
			
			ui.tweenScreenTint(0, 1);
			
			world.remove(this);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}