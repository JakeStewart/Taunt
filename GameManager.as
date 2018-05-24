package  
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import net.jacob_stewart.JS;
	import net.jacob_stewart.MousePointer;
	
	import game_piece.GamePiece;
	import game_piece.Dot;
	import game_piece.Lightning;
	import game_piece.X;
	import gui.GUI_Manager;
	import preview_path.MoveToButton;
	import preview_path.PreviewPathSegment;
	import preview_path.Vertical;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GameManager extends EntityGame 
	{
		public const MENU:uint = 1;
		public const WINNER:uint = 2;
		public const IDLE_GREEN:uint = 3;
		public const IDLE_ORANGE:uint = 4;
		public const PENDINGMOVE_GREEN:uint = 5;
		public const PENDINGMOVE_ORANGE:uint = 6;
		public const MOVING:uint = 7;
		public const SWITCHINGTURNS:uint = 8;
		public const ASKRESET:uint = 9;
		public const RESETTING:uint = 10;
		public var state:uint = RESETTING;
		
		
		private var ui:GUI_Manager = new GUI_Manager;
		private var mousePointer:MousePointer = new MousePointer([JS.TYPE_Button]);
		private var gp:GamePiece;
		
		public var playerTurn:String = Game.NONE;
		public const NO_GAMEPIECE_PENDINGMOVE_NUM:int = -1;
		public var gamePieceNumPendingMove:int = NO_GAMEPIECE_PENDINGMOVE_NUM;
		
		public var gamePieces:Array = new Array(Game.GP_COUNT);
		
		private var spaceCoords:Array = new Array(Game.SPACE_COUNT);
		
		private const SPACE_COORDS_X:Array = [382, 447, 512, 577];
		private const SPACE_COORDS_Y:Array = [59, 124, 189, 254, 319, 384, 449, 514, 579, 644];
		
		// private const START_SPACES:Array = [9, 10, 11, 5, 6, 7, 1, 2, 3, 28, 29, 30, 32, 33, 34, 36, 37, 38];
		// private const START_SPACES:Array = [9, 14, 19, 5, 10, 15, 1, 6, 11, 28, 25, 22, 32, 29, 26, 36, 33, 30];
		// private const START_SPACES:Array = [17, 14, 11, 13, 10, 7, 9, 6, 3, 28, 25, 22, 32, 29, 26, 36, 33, 30];
		// private const START_SPACES:Array = [35, 31, 27, 23, 19, 15, 11, 7, 3, 4, 8, 12, 16, 20, 24, 28, 32, 36];
		private const START_SPACES:Array = [8, 7, 6, 5, 4, 3, 2, 1, 0, 31, 32, 33, 34, 35, 36, 37, 38, 39];
		
		
		/*
		private const HOMESPACECOORDS_ORANGEX1:Point = new Point(447, 59);
		private const HOMESPACECOORDS_ORANGEX2:Point = new Point(512, 59);
		private const HOMESPACECOORDS_ORANGEX3:Point = new Point(577, 59);
		private const HOMESPACECOORDS_ORANGELIGHTNING1:Point = new Point(447, 124);
		private const HOMESPACECOORDS_ORANGELIGHTNING2:Point = new Point(512, 124);
		private const HOMESPACECOORDS_ORANGELIGHTNING3:Point = new Point(577, 124);
		private const HOMESPACECOORDS_ORANGEDOT1:Point = new Point(447, 189);
		private const HOMESPACECOORDS_ORANGEDOT2:Point = new Point(512, 189);
		private const HOMESPACECOORDS_ORANGEDOT3:Point = new Point(577, 189);
		private const HOMESPACECOORDS_GREENDOT1:Point = new Point(382, 514);
		private const HOMESPACECOORDS_GREENDOT2:Point = new Point(447, 514);
		private const HOMESPACECOORDS_GREENDOT3:Point = new Point(512, 514);
		private const HOMESPACECOORDS_GREENLIGHTNING1:Point = new Point(382, 579);
		private const HOMESPACECOORDS_GREENLIGHTNING2:Point = new Point(447, 579);
		private const HOMESPACECOORDS_GREENLIGHTNING3:Point = new Point(512, 579);
		private const HOMESPACECOORDS_GREENX1:Point = new Point(382, 644);
		private const HOMESPACECOORDS_GREENX2:Point = new Point(447, 644);
		private const HOMESPACECOORDS_GREENX3:Point = new Point(512, 644);
		private const HOMESPACECOORDS:Array = [HOMESPACECOORDS_ORANGEDOT1, HOMESPACECOORDS_ORANGEDOT2, HOMESPACECOORDS_ORANGEDOT3, HOMESPACECOORDS_ORANGELIGHTNING1, HOMESPACECOORDS_ORANGELIGHTNING2, HOMESPACECOORDS_ORANGELIGHTNING3, HOMESPACECOORDS_ORANGEX1, HOMESPACECOORDS_ORANGEX2, HOMESPACECOORDS_ORANGEX3, HOMESPACECOORDS_GREENDOT1, HOMESPACECOORDS_GREENDOT2, HOMESPACECOORDS_GREENDOT3, HOMESPACECOORDS_GREENLIGHTNING1, HOMESPACECOORDS_GREENLIGHTNING2, HOMESPACECOORDS_GREENLIGHTNING3, HOMESPACECOORDS_GREENX1, HOMESPACECOORDS_GREENX2, HOMESPACECOORDS_GREENX3];
		
		private const SPACEOCCUPATION_DEFAULT:Array = ["empty", "orange", "orange", "orange", "empty", "orange", "orange", "orange", "empty", "orange", "orange", "orange", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "green", "green", "green", "empty", "green", "green", "green", "empty", "green", "green", "green", "empty"];
		*/
		
		
		public var spaceOccupation:Array = new Array(Game.SPACE_COUNT);
		
		// cellG/cellO mean prison cell Green, prison cell Orange
		// These are the coordinates for where a GamePiece 
		// will move to when it's taken.
		private const JAIL_G1:Point = new Point(71, 183);
		private const JAIL_G2:Point = new Point(151, 183);
		private const JAIL_G3:Point = new Point(231, 183);
		private const JAIL_G4:Point = new Point(71, 263);
		private const JAIL_G5:Point = new Point(151, 263);
		private const JAIL_G6:Point = new Point(231, 263);
		private const JAIL_G7:Point = new Point(71, 343);
		private const JAIL_G8:Point = new Point(151, 343);
		private const JAIL_G9:Point = new Point(231, 343);
		
		private const JAIL_O1:Point = new Point(729, 183);
		private const JAIL_O2:Point = new Point(809, 183);
		private const JAIL_O3:Point = new Point(889, 183);
		private const JAIL_O4:Point = new Point(729, 263);
		private const JAIL_O5:Point = new Point(809, 263);
		private const JAIL_O6:Point = new Point(889, 263);
		private const JAIL_O7:Point = new Point(729, 343);
		private const JAIL_O8:Point = new Point(809, 343);
		private const JAIL_O9:Point = new Point(889, 343);
		
		public const JAIL_COORDS:Array = [JAIL_G1, JAIL_G2, JAIL_G3, JAIL_G4, JAIL_G5, JAIL_G6, JAIL_G7, JAIL_G8, JAIL_G9, JAIL_O1, JAIL_O2, JAIL_O3, JAIL_O4, JAIL_O5, JAIL_O6, JAIL_O7, JAIL_O8, JAIL_O9];
		
		private var jailsGreen:Array = [null, null, null, null, null, null, null, null, null];
		private var jailsOrange:Array = [null, null, null, null, null, null, null, null, null];
		public var jails:Array = [jailsGreen, jailsOrange];
		
		
		private var exitMenuSfx:Sfx = new Sfx(Sounds.EXITMENU);
		
		
		
		public function GameManager() 
		{
			super();
		}
		
		override public function init():void 
		{
			super.init();
			
			
			name = Game.NAME_GameManager;
			
			children.push(ui, mousePointer);
			setGamePieces();
		}
		
		override public function added():void 
		{
			super.added();
			
			
			epAddList(children);
			world.addList(gamePieces);
			createNewGame();
		}
		
		override public function update():void 
		{
			super.update();
			
			
			// deBug();
		}
		// -------------------------------------------------------------
		
		
		private function setGamePieces():void
		{
			var count:uint = 0;
			
			for (var row:uint = 0; row < Game.ROW_COUNT; row++)
			{
				for (var column:uint = 0; column < Game.COLUMN_COUNT; column++)
				{
					spaceCoords[count] = new Point(SPACE_COORDS_X[column], SPACE_COORDS_Y[row]);
					count++;
				}
			}
			
			count = 0;
			var nameNum:uint = 1;
			
			for (var playerNum:uint = 0; playerNum < Game.PLAYER_COUNT; playerNum++) // each player
			{
				for (var typeNum:uint = 0; typeNum < Game.GP_CLASSES.length; typeNum++) // each game piece type (Dot, Lightning, X)
				{
					for (var i:uint = 0; i < Game.GP_TYPE_COUNT; i++) // each type piece
					{
						gamePieces[count] = new Game.GP_CLASSES[typeNum];
						gp = gamePieces[count];
						gp._GamePiece(this, spaceCoords[START_SPACES[count]].x, spaceCoords[START_SPACES[count]].y, playerNum, count, START_SPACES[count], nameNum);
						
						children.push(gp.hitBox2, gp.dirArrow);
						
						
						nameNum++;
						if (nameNum == Game.GP_TYPE_COUNT + 1) nameNum = 1;
						count++;
					}
				}
			}
		}
		// -------------------------------------------------------------
		
		
		public function createNewGame():void
		{
			resetValues();
			ui.createNewGame();
			ui.tweenScreenTint(0, 1, tweenToStartSpaces);
		}
		
		private function tweenToStartSpaces():void
		{
			var distance:Number = 0;
			var greatestDistance:Number = 0;
			var index:uint;
			
			for (var i:uint = 0; i < gamePieces.length; i++)
			{
				gp = gamePieces[i];
				if (gp.currentSpace != gp.startSpace || gp.isTaken)
				{
					distance = FP.distance(gp.x, gp.y, spaceCoords[START_SPACES[i]].x, spaceCoords[START_SPACES[i]].y);
					
					if (greatestDistance < distance)
					{
						greatestDistance = distance;
						index = i;
					}
				}
			}
			
			
			
			if (greatestDistance > 0) // If at least one GamePiece is not on its starting space
			{
				var onComplete:Function = null;
				for (var j:uint = 0; j < gamePieces.length; j++)
				{
					gp = gamePieces[j];
					if (gp.currentSpace != gp.startSpace || gp.isTaken)
					{
						onComplete = null;
						if (j == index) onComplete = startGame;
						gp.tweenCoords(spaceCoords[START_SPACES[j]].x, spaceCoords[START_SPACES[j]].y, Game.duration(gp.x, gp.y, spaceCoords[START_SPACES[j]].x, spaceCoords[START_SPACES[j]].y), onComplete, Ease.sineOut);
					}
				}
			}
			else startGame();
		}
		
		
		/*
		private function tweenToStartSpaces():void
		{
			var distance:Number = 0;
			var greatestDistance:Number = 0;
			var index:uint;
			
			for (var i:uint = 0; i < gamePieces.length; i++)
			{
				gp = gamePieces[i];
				if (gp.currentSpace != gp.startSpace || gp.isTaken)
				{
					distance = FP.distance(gp.x, gp.y, spaceCoords[START_SPACES[i]].x, spaceCoords[START_SPACES[i]].y);
					
					if (greatestDistance < distance)
					{
						greatestDistance = distance;
						index = i;
					}
				}
			}
			
			
			
			if (greatestDistance > 0) // If at least one GamePiece is not on its starting space
			{
				var onComplete:Function = null;
				var moveRate:Number = 500;
				var duration:Number;
				var delay:Number = 0;
				
				for (var j:uint = 0; j < gamePieces.length; j++)
				{
					gp = gamePieces[j];
					if (gp.currentSpace != gp.startSpace || gp.isTaken)
					{
						onComplete = null;
						if (j == index) onComplete = startGame;
						
						distance = FP.distance(gp.x, gp.y, spaceCoords[START_SPACES[j]].x, spaceCoords[START_SPACES[j]].y);
						duration = distance / moveRate;
						
						gp.tweenCoords(spaceCoords[START_SPACES[j]].x, spaceCoords[START_SPACES[j]].y, duration, onComplete, Ease.sineOut, delay);
					}
				}
			}
			else startGame();
			
			
			delay = 0;
		}
		*/
		
		
		
		private function startGame():void
		{
			if (FP.choose(Game.ORANGE, Game.GREEN) == Game.GREEN)
			{
				state = IDLE_GREEN;
				playerTurn = Game.GREEN;
				Images.greenTitle.alpha = 1;
			}
			else
			{
				state = IDLE_ORANGE;
				playerTurn = Game.ORANGE;
				Images.orangeTitle.alpha = 1;
			}
			
			for each (gp in gamePieces) gp.resetValues();
			createPreviewPaths();
			
			if (playerTurn == Game.GREEN)
			{
				tweenGamePiecesAlpha(Game.GREEN, 1, .2);
				tweenGamePiecesAlpha(Game.ORANGE, 0, .2);
			}
			else
			{
				tweenGamePiecesAlpha(Game.ORANGE, 1, .2);
				tweenGamePiecesAlpha(Game.GREEN, 0, .2);
			}
		}
		
		public function tweenGamePiecesAlpha(playerTurn:String, alphaTo:Number, duration:Number):void
		{
			for each (gp in gamePieces)
			{
				if (gp.gamePieceColor == playerTurn && !gp.isTaken) FP.tween(gp.normal, { alpha: alphaTo }, duration, { tweener: gp } );
			}
		}
		
		private function resetValues():void
		{
			for each (gp in gamePieces)
			{
				for each (var moveToBtn:MoveToButton in gp.moveToBtns) moveToBtn.setDefaults();
				for each (var segments:Array in gp.pathSegments)
				{
					for each (var segment:PreviewPathSegment in segments) FP.tween(segment.imgUsed, { alpha: 0 }, .2, { tweener: segment } );
				}
			}
			
			gamePieceNumPendingMove = NO_GAMEPIECE_PENDINGMOVE_NUM;
			
			for (var i:uint = 0; i < Game.SPACE_COUNT; i++) spaceOccupation[i] = Game.EMPTY;
			
			for (var m:uint = 0; m < gamePieces.length; m++)
			{
				gp = gamePieces[m];
				if (gp.gamePieceColor == Game.GREEN) spaceOccupation[START_SPACES[m]] = Game.GREEN;
				else spaceOccupation[START_SPACES[m]] = Game.ORANGE;
			}
			
			for (var j:uint = 0; j < Game.PLAYER_COUNT; j++)
			{
				for (var k:uint = 0; k < Game.PLAYER_GP_COUNT; k++) jails[j][k] = null;
			}
		}
		
		public function createPreviewPaths():void
		{
			for each (gp in gamePieces)
			{
				if (!gp.isTaken) gp.createPaths();
			}
		}
		// -------------------------------------------------------------
		
		
		public function switchTurns():void
		{
			createPreviewPaths();
			ui.switchTurns();
			
			if (playerTurn == Game.GREEN)
			{
				state = IDLE_ORANGE;
				playerTurn = Game.ORANGE;
			}
			else
			{
				state = IDLE_GREEN;
				playerTurn = Game.GREEN;
			}
		}
		// -------------------------------------------------------------
		
		
		public function declareWinner():void
		{
			state = WINNER;
			Sounds.winner.play();
			ui.declareWinner();
			playerTurn = Game.NONE;
		}
		// -------------------------------------------------------------
		
		
		public function resetGame():void
		{
			state = RESETTING;
			createNewGame();
		}
		// -------------------------------------------------------------
		
		// Debug stuff:
		private function deBug():void
		{
			if (Input.pressed(Key.T))
			{
				for each (gp in gamePieces)
				{
					trace("gp.world: ", gp.world, ", gp.x: ", gp.x, ", gp.y: ", gp.y);
				}
			}
		}
		
	}

}