package preview_path 
{
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Tween;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	
	import net.jacob_stewart.Button;
	import net.jacob_stewart.tweens.AlphaPulse;
	
	import game_piece.GamePiece;
	import game_piece.Lightning;
	import game_piece.X;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class MoveToButton extends Button 
	{
		public var gm:GameManager;
		private var gp:GamePiece;
		private var moveToBtn:MoveToButton;
		
		public var img:Image = new Image(Images.SQUAREHIGHLIGHT);
		public var normal:Image;
		public var hover:Image;
		public var down:Image;
		
		public var gamePieceNum:uint;
		public var spaceNum:uint;
		public var willChangeDirection:Boolean = false;
		public var midSpaceX:uint;
		public var midSpaceY:uint;
		public var duration:Number;
		
		private var alphaPulse:AlphaPulse;
		private const PULSEALPHALOW:Number = .2;
		private const PULSEALPHAHIGH:Number = .7;
		private var PREVIEWALPHABASE:Number = .3;
		private var previewAlpha:Number = PREVIEWALPHABASE;
		
		public var pathDirection:uint;
		private var collidableStates:Array = new Array;
		private var visibleStates:Array = new Array;
		
		
		
		public function MoveToButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			layer = -3;
			
			normal = img;
			hover = img;
			down = img;
			
			img.alpha = PREVIEWALPHABASE;
			
			epSetHitbox(64, 64);
		}
		
		override public function setDefaults():void 
		{
			super.setDefaults();
			img.alpha = PREVIEWALPHABASE;
			disableButton();
		}
		
		override public function added():void 
		{
			super.added();
			
			
			gm = world.getInstance(Game.NAME_GameManager) as GameManager;
			
			gp = gm.gamePieces[gamePieceNum];
			if (gp.gamePieceColor == Game.GREEN)
			{
				collidableStates.push(gm.PENDINGMOVE_GREEN);
				visibleStates.push(gm.IDLE_GREEN, gm.PENDINGMOVE_GREEN);
			}
			else if (gp.gamePieceColor == Game.ORANGE)
			{
				collidableStates.push(gm.PENDINGMOVE_ORANGE);
				visibleStates.push(gm.IDLE_ORANGE, gm.PENDINGMOVE_ORANGE);
			}
		}
		// -------------------------------------------------------------
		
		override public function update():void 
		{
			updateCollidable();
			
			
			super.update();
			
			
			updateVisibility();
			updatePreviewAlpha();
		}
		
		private function updateCollidable():void
		{
			collidable = false;
			if (gm.gamePieceNumPendingMove == gamePieceNum && collidableStates.indexOf(gm.state) != -1) collidable = true;
		}
		
		override public function interactivity():void 
		{
			if (collidable) super.interactivity();
		}
		
		private function updateVisibility():void
		{
			visible = false;
			
			if (visibleStates.indexOf(gm.state) != -1)
			{
				gp = gm.gamePieces[gamePieceNum];
				if (gp.state == gp.HOVER || gp.state == gp.DOWN) visible = true;
				else if (gm.gamePieceNumPendingMove == gamePieceNum) visible = true;
			}
		}
		
		private function updatePreviewAlpha():void
		{
			if (gm.gamePieceNumPendingMove != gamePieceNum)
			{
				if (gm.gamePieceNumPendingMove != gm.NO_GAMEPIECE_PENDINGMOVE_NUM) previewAlpha = PREVIEWALPHABASE - (PREVIEWALPHABASE * .4); // A GamePiece is pending move choice.
				else previewAlpha = PREVIEWALPHABASE; // There is no GamePiece pending move choice.
				
				img.alpha = previewAlpha;
			}
		}
		// -------------------------------------------------------------
		
		override public function changeStateNormal():void 
		{
			super.changeStateNormal();
			graphic = normal;
		}
		
		override public function changeStateHover():void 
		{
			super.changeStateHover();
			graphic = hover;
		}
		
		override public function changeStateDown():void 
		{
			super.changeStateDown();
			graphic = down;
		}
		
		override public function click():void 
		{
			super.click();
			
			
			Sounds.menuButtonClick.play();
			
			gp = gm.gamePieces[gamePieceNum];
			
			for each (moveToBtn in gp.moveToBtns) moveToBtn.disableButton();
			gp.fadePaths(pathDirection);
			
			if (gp.getClass() == X)
			{
				if (gp.x == x || gp.y == y) gp.moveToNewSpace(spaceNum, midSpaceX, midSpaceY, duration, true, true, x, y); // Bounce move
				else gp.moveToNewSpace(spaceNum, x, y, duration, true); // Non-bounce move
			}
			else if (gp.getClass() == Lightning && (gp.x == x && gp.y == y)) gp.moveToNewSpace(spaceNum, midSpaceX, midSpaceY, duration, false, true, x, y); // Lightning bounce move
			else gp.moveToNewSpace(spaceNum, x, y, duration); // Dot or Lightning non-bounce non-diagonal move.
			
			gp.willChangeDirection = willChangeDirection;
		}
		// -------------------------------------------------------------
		
		
		public function enableButton():void
		{
			alphaPulse = world.add(new AlphaPulse(img, PULSEALPHAHIGH, PULSEALPHALOW, .5)) as AlphaPulse;
		}
		
		public function disableButton():void
		{
			if (alphaPulse)
			{
				if (alphaPulse.world) world.remove(alphaPulse);
			}
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}