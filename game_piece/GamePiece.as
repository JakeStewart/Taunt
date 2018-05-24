package game_piece 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	
	import net.jacob_stewart.Button;
	import net.jacob_stewart.JS;
	import net.jacob_stewart.other.RunFunctionOnAdd;
	
	import game_piece.GamePieceHitBox2;
	import gui.DirectionalArrow;
	import preview_path.DotDestination;
	import preview_path.MoveToButton;
	import preview_path.PreviewPathSegment;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GamePiece extends Button 
	{
		private var gm:GameManager;
		public var subType1:String;
		
		public var normal:Image;
		public var hover:Image;
		private var down:Image;
		
		private var moveToBtn:MoveToButton;
		private var pathSegment:PreviewPathSegment;
		
		public var gamePieceColor:String;
		private var isBlack:Boolean = true;
		private var opponentColor:String;
		public var isMovingUp:Boolean = false;
		public var willChangeDirection:Boolean = false;
		public var isTaken:Boolean = false;
		
		public var currentSpace:uint;
		public var startSpace:uint;
		public var gamePieceNum:uint;
		public var spaceDiff:int;
		
		public var hitBox2:GamePieceHitBox2 = new GamePieceHitBox2;
		
		// playerNum will be 0 if this game piece is orange, 1 if it's green.
		// Used to access the correct prisonCell arrays in GameManager.
		private var playerNum:uint;
		
		public var isMovingSpaces:Boolean = false;
		private var duration:Number;
		private const SECONDS_ACROSS_SCREEN:Number = 2.5; // The time (in seconds) it takes to move FP.width
		// (FP.width / SECONDS_ACROSS_SCREEN): Length traveled per second
		// (FP.width / SECONDS_ACROSS_SCREEN) / FP.assignedFrameRate: Length traveled per frame
		private const TAKEN_MOVERATE:Number = (FP.width / SECONDS_ACROSS_SCREEN) / FP.assignedFrameRate;
		
		private var destinationX:Number;
		private var destinationY:Number;
		
		private var willBounce:Boolean = false;
		private var destinationX2:Number;
		private var destinationY2:Number;
		
		public var row1:Array = [0, 1, 2, 3];
		public var row2:Array = [4, 5, 6, 7];
		public var row3:Array = [8, 9, 10, 11];
		public var row4:Array = [12, 13, 14, 15];
		public var row5:Array = [16, 17, 18, 19];
		public var row6:Array = [20, 21, 22, 23];
		public var row7:Array = [24, 25, 26, 27];
		public var row8:Array = [28, 29, 30, 31];
		public var row9:Array = [32, 33, 34, 35];
		public var row10:Array = [36, 37, 38, 39];
		public var rows:Array = [row1, row2, row3, row4, row5, row6, row7, row8, row9, row10];
		
		public var column1:Array = [0, 4, 8, 12, 16, 20, 24, 28, 32, 36];
		public var column2:Array = [1, 5, 9, 13, 17, 21, 25, 29, 33, 37];
		public var column3:Array = [2, 6, 10, 14, 18, 22, 26, 30, 34, 38];
		public var column4:Array = [3, 7, 11, 15, 19, 23, 27, 31, 35, 39];
		
		public var moveToBtns:Array = new Array;
		
		public var pathSegments:Array = [new Array, new Array, new Array, new Array];
		private var homePathDot:DotDestination = new DotDestination;
		
		private var oppsTurnImg:Image;
		public var blackImg:Image;
		public var whiteImg:Image;
		
		public var dirArrow:DirectionalArrow = new DirectionalArrow;
		
		private var collidableStates:Array = new Array;
		
		
		
		public function GamePiece(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			epSetHitbox(44, 44, -10, -10);
			layer = -4;
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			updateCollidable();
			// updateMouseOverSound();
			super.update();
		}
		
		private function updateCollidable():void
		{
			collidable = false;
			if (collidableStates.indexOf(gm.state) != -1 && !isTaken) collidable = true;
		}
		
		private function updateMouseOverSound():void
		{
			if (collidable && state == NORMAL && JS.collideMouse(this)) Sounds.mouseOverGamePiece.play();
		}
		
		override public function changeState(state:int = -1):void 
		{
			if (isPendingMove() || isMovingSpaces) this.state = HOVER;
			if (!isTaken) super.changeState(state);
		}
		
		override public function changeStateNormal():void 
		{
			super.changeStateNormal();
			(graphic as Graphiclist).children.splice(2, 1, normal);
		}
		
		override public function changeStateHover():void 
		{
			super.changeStateHover();
			(graphic as Graphiclist).children.splice(2, 1, hover);
		}
		
		override public function changeStateDown():void 
		{
			super.changeStateDown();
			(graphic as Graphiclist).children.splice(2, 1, down);
		}
		
		override public function click():void 
		{
			if (collidable && moveToBtns.length > 0)
			{
				Sounds.menuButtonClick.play();
				pendingMoveToggle();
			}
		}
		// -------------------------------------------------------------
		
		
		public function createPaths():void
		{
			world.add(homePathDot);
			homePathDot.x = x;
			homePathDot.y = y;
			homePathDot.gamePieceNum = gamePieceNum;
			homePathDot.chooseImg(false);
			
			clearArray(moveToBtns);
			clearArray(pathSegments[0]);
			clearArray(pathSegments[1]);
			clearArray(pathSegments[2]);
			clearArray(pathSegments[3]);
		}
		
		public function addDirection(moveDir:uint, lineClass:Class, dotClass:Class, xOffsetLine:int = 0, yOffsetLine:int = 0, xOffsetDot:int = 0, yOffsetDot:int = 0, needLong:Boolean = false):void
		{
			addSegment(moveDir, lineClass, xOffsetLine, yOffsetLine, needLong);
			addSegment(moveDir, dotClass, xOffsetDot, yOffsetDot);
		}
		
		public function addSegment(moveDir:uint, pathClass:Class, xOffset:int, yOffset:int, needLong:Boolean = false):void
		{
			pathSegments[moveDir].push(world.create(pathClass));
			pathSegment = pathSegments[moveDir][pathSegments[moveDir].length - 1];
			
			pathSegment.x = x + xOffset;
			pathSegment.y = y + yOffset;
			pathSegment.gamePieceNum = gamePieceNum;
			pathSegment.chooseImg(needLong);
		}
		
		// Clear the pathSegments or moveToBtns arrays.
		private function clearArray(array:Array):void
		{
			for (var i:uint = 0; i < array.length; i++) world.recycle(array[i]);
			array.length = 0;
		}
		
		public function fadePaths(moveDir:uint):void
		{
			for (var i:uint = 0; i < 4; i++)
			{
				if (i != moveDir && pathSegments[i].length > 0)
				{
					for each (pathSegment in pathSegments[i]) FP.tween(pathSegment.imgUsed, { alpha: 0 }, .2, { tweener: pathSegment } );
				}
			}
		}
		// -------------------------------------------------------------
		
		
		public function addMoveToButton(moveDir:uint, x:int, y:int, spaceDiff:int, duration:Number, willBounce:Boolean = false, midSpaceX:uint = 0, midSpaceY:uint = 0):void
		{
			if (gm.spaceOccupation[currentSpace + spaceDiff] != gamePieceColor || spaceDiff == 0)
			{
				moveToBtns.push(world.create(MoveToButton));
				moveToBtn =  moveToBtns[moveToBtns.length - 1];
				
				moveToBtn.x = x;
				moveToBtn.y = y;
				moveToBtn.gamePieceNum = gamePieceNum;
				moveToBtn.spaceNum = currentSpace + spaceDiff;
				moveToBtn.duration = duration;
				moveToBtn.midSpaceX = midSpaceX;
				moveToBtn.midSpaceY = midSpaceY;
				moveToBtn.pathDirection = moveDir;
				
				// Check if this MoveToButton will cause the GamePiece to change direction.
				if (getClass() != Dot && !isInRowOrColumn(row1) && !isInRowOrColumn(row10))
				// if (subType1 != "Dot" && !isInRowOrColumn(row1) && !isInRowOrColumn(row10))
				{
					// Check if the move is not a horizontal move.
					if (currentSpace + spaceDiff != currentSpace - 1 && currentSpace + spaceDiff != currentSpace + 1)
					{
						if (isMovingUp && (isInRowOrColumn(row2) || isInRowOrColumn(row3))) moveToBtn.willChangeDirection = true;
						else if (!isMovingUp && (isInRowOrColumn(row8) || isInRowOrColumn(row9))) moveToBtn.willChangeDirection = true;
						else moveToBtn.willChangeDirection = false;
					}
					else moveToBtn.willChangeDirection = false;
				}
				else moveToBtn.willChangeDirection = false;
			}
		}
		// -------------------------------------------------------------
		
		
		public function pendingMoveToggle():void
		{
			if (!isPendingMove()) pendingMoveOn();
			else pendingMoveOff();
		}
		
		private function pendingMoveOn():void
		{
			if (gm.gamePieceNumPendingMove != gm.NO_GAMEPIECE_PENDINGMOVE_NUM)
			{
				var gp:GamePiece = gm.gamePieces[gm.gamePieceNumPendingMove];
				gp.pendingMoveOff();
			}
			
			if (gamePieceColor == Game.GREEN) gm.state = gm.PENDINGMOVE_GREEN;
			else gm.state = gm.PENDINGMOVE_ORANGE;
			
			gm.gamePieceNumPendingMove = gamePieceNum;
			for each (moveToBtn in moveToBtns) moveToBtn.enableButton();
		}
		
		public function pendingMoveOff():void
		{
			if (gamePieceColor == Game.GREEN) gm.state = gm.IDLE_GREEN;
			else gm.state = gm.IDLE_ORANGE;
			
			gm.gamePieceNumPendingMove = gm.NO_GAMEPIECE_PENDINGMOVE_NUM;
			
			for each (moveToBtn in moveToBtns) moveToBtn.disableButton();
		}
		
		private function isPendingMove():Boolean
		{
			if (gm.gamePieceNumPendingMove == gamePieceNum) return true;
			return false;
		}
		// -------------------------------------------------------------
		
		
		public function moveToNewSpace(newSpaceNum:uint, destX:Number, destY:Number, duration:Number, isDiag:Boolean = false, willBounce:Boolean = false, destX2:Number = 0, destY2:Number = 0):void
		{
			pendingMoveToggle();
			
			gm.state = gm.MOVING;
			
			gm.spaceOccupation[currentSpace] = Game.EMPTY;
			gm.spaceOccupation[newSpaceNum] = gamePieceColor;
			currentSpace = newSpaceNum;
			
			destinationX = destX;
			destinationY = destY;
			destinationX2 = destX2;
			destinationY2 = destY2;
			
			this.duration = duration;
			this.willBounce = willBounce;
			
			tweenCoords(destinationX, destinationY, duration, onFinishMove, Ease.quintOut);
			
			isMovingSpaces = true;
		}
		
		private function onFinishMove():void
		{
			if (willBounce)
			{
				willBounce = false;
				
				// If the space the GamePiece will end up at is between rows 1 & 10.
				if (currentSpace > 3 && currentSpace < 36) changeDirections();
				
				destinationX = destinationX2;
				destinationY = destinationY2;
				
				tweenCoords(destinationX, destinationY, duration, onFinishMove, Ease.quintOut);
			}
			else // Destination reached, complete move.
			{
				isMovingSpaces = false;
				changeDirections();
				
				if (gm.state != gm.WINNER)
				{
					gm.state = gm.SWITCHINGTURNS;
					gm.tweenGamePiecesAlpha(gamePieceColor, 0, .1);
					gm.tweenGamePiecesAlpha(opponentColor, 1, .2);
					FP.alarm(.3, gm.switchTurns);
				}
			}
		}
		
		public function tweenCoords(toX:Number, toY:Number, duration:Number, onComplete:Function = null, ease:Function = null, delay:Number = 0):void
		{
			if (isTaken) trace("duration: ", duration);
			FP.tween(this, { x: toX, y: toY }, duration, { complete: onComplete, ease: ease, tweener: this, delay: delay } );
			FP.tween(dirArrow, { x: toX, y: toY }, duration, { ease: ease, tweener: dirArrow, delay: delay } );
			FP.tween(hitBox2, { x: toX, y: toY }, duration, { ease: ease, tweener: hitBox2, delay: delay } );
		}
		// -------------------------------------------------------------
		
		
		public function taken():void
		{
			isTaken = true;
			dirArrow.visible = false;
			normal.alpha = 0;
			if (gm.spaceOccupation[currentSpace] != opponentColor) gm.spaceOccupation[currentSpace] = Game.EMPTY;
			
			for each (moveToBtn in moveToBtns) moveToBtn.disableButton();
			for each (var list:Array in pathSegments) clearArray(list);
			
			// Move GamePiece to prison
			for (var i:uint = 0; i < Game.PLAYER_GP_COUNT; i++)
			{
				if (gm.jails[playerNum][i] == null)
				{
					// var takenDuration:Number = (FP.distance(x, y, gm.JAIL_COORDS[gamePieceNum].x, gm.JAIL_COORDS[gamePieceNum].y) / Game.MOVE_RATE) / FP.assignedFrameRate;
					tweenCoords(gm.JAIL_COORDS[gamePieceNum].x, gm.JAIL_COORDS[gamePieceNum].y, Game.duration(x, y, gm.JAIL_COORDS[gamePieceNum].x, gm.JAIL_COORDS[gamePieceNum].y), null, Ease.quintOut);
					gm.jails[playerNum][i] = this;
					i = Game.PLAYER_GP_COUNT;
				}
			}
			
			// Check for winner
			var gp:GamePiece;
			for (var j:uint = 0; j < gm.gamePieces.length; j++)
			{
				gp = gm.gamePieces[j];
				if (gp.gamePieceColor == gamePieceColor && !gp.isTaken) j = Game.GP_COUNT;
				if (j == Game.GP_COUNT - 1) gm.declareWinner();
			}
		}
		// -------------------------------------------------------------
		
		
		public function isInRowOrColumn(list:Array):Boolean
		{
			for (var i:uint = 0; i < list.length; i++)
			{
				if (currentSpace == list[i]) return true;
			}
			
			return false;
		}
		
		public function isOnSameTeam(spaceDiff:int):Boolean
		{
			if (gm.spaceOccupation[currentSpace + spaceDiff] != gamePieceColor || spaceDiff == 0) return false;
			else return true;
		}
		// -------------------------------------------------------------
		
		
		private function changeDirections():void
		{
			if (willChangeDirection)
			{
				willChangeDirection = false;
				
				if (isBlack)
				{
					isBlack = false;
					(graphic as Graphiclist).children.splice((graphic as Graphiclist).children.indexOf(blackImg), 1, whiteImg);
				}
				else
				{
					isBlack = true;
					(graphic as Graphiclist).children.splice((graphic as Graphiclist).children.indexOf(whiteImg), 1, blackImg);
				}
				
				if (isMovingUp)
				{
					isMovingUp = false;
					dirArrow.setDirection(1);
				}
				else
				{
					isMovingUp = true;
					dirArrow.setDirection(0);
				}
			}
		}
		
		private function setGamePieceColorValues(playerNum:uint):void
		{
			var btnStateImgs:Array = new Array(2);
			switch(playerNum)
			{
				case 0: // Orange
					isMovingUp = false;
					playerNum = 0;
					gamePieceColor = Game.ORANGE;
					opponentColor = Game.GREEN;
					oppsTurnImg = new Image(Images.ORANGEOPPSTURN);
					btnStateImgs[0] = new Image(Images.ORANGENORMAL);
					btnStateImgs[1] = new Image(Images.ORANGEHOVER);
					dirArrow.setDirection(1);
					break;
				case 1: // Green
					isMovingUp = true;
					playerNum = 1;
					gamePieceColor = Game.GREEN;
					opponentColor = Game.ORANGE;
					oppsTurnImg = new Image(Images.GREENOPPSTURN);
					btnStateImgs[0] = new Image(Images.GREENNORMAL);
					btnStateImgs[1] = new Image(Images.GREENHOVER);
					dirArrow.setDirection(0);
					break;
			}
			
			normal = btnStateImgs[0];
			hover = btnStateImgs[1];
			down = btnStateImgs[1];
		}
		// -------------------------------------------------------------
		
		
		public function resetValues():void
		{
			currentSpace = startSpace;
			isTaken = false;
			
			// If the GamePiece is white, change it to black
			if (!isBlack)
			{
				willChangeDirection = true;
				changeDirections();
			}
		}
		// -------------------------------------------------------------
		
		
		public function _GamePiece(gm:GameManager, x:Number, y:Number, playerNum:uint, gamePieceNum:uint, startSpace:uint, nameNum:uint):void
		{
			this.gm = gm;
			this.x = x, this.y = y;
			this.playerNum = playerNum;
			this.gamePieceNum = gamePieceNum;
			this.startSpace = startSpace;
			
			currentSpace = startSpace;
			setGamePieceColorValues(playerNum);
			name = gamePieceColor + subType1 + nameNum.toString();
			
			if (gamePieceColor == Game.GREEN) collidableStates.push(gm.IDLE_GREEN, gm.PENDINGMOVE_GREEN);
			else if (gamePieceColor == Game.ORANGE) collidableStates.push(gm.IDLE_ORANGE, gm.PENDINGMOVE_ORANGE);
			
			dirArrow.x = x, dirArrow.y = y;
			hitBox2.x = x, hitBox2.y = y;
			
			hitBox2.gamePieceNum = gamePieceNum;
			hitBox2.opponentColor = opponentColor;
			hitBox2.type = gamePieceColor;
			
			normal.alpha = 0;
			
			addGraphic(new Image(Images.GAMEPIECESHADOW2));
			addGraphic(oppsTurnImg);
			addGraphic(normal);
			addGraphic(blackImg);
			
			/*
			gp.gm = this;
			gp.x = boardSpaceCoords[STARTINGSPACES[count]].x;
			gp.y = boardSpaceCoords[STARTINGSPACES[count]].y;
			gp.gamePieceNum = count;
			gp.startingSpace = STARTINGSPACES[count];
			gp.currentSpace = STARTINGSPACES[count];
			gp.setGamePieceColorValues(i);
			gp.name = gp.gamePieceColor + gp.subType1 + nameNum.toString();
			*/
			
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}