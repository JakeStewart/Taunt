package documentation
{
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class BugNotes 
	{
		/*
		 * 1:------------------- RESOLVED
		 * On the 2nd game, orange Dot pieces moving over
		 * green Dot pieces did not take the green Dot piece,
		 * but the green Dot piece was no longer usable on 
		 * green's turn. Hitbox2 Entity was still showing
		 * on the green Dot pieces in console.
		 * 
		 * 2:------------------- RESOLVED
		 * If a GamePiece is in pending move choice mode
		 * and the game is reset with ResetGameButton,
		 * the displayed path remains visible.
		 * 
		 * 4:------------------- RESOLVED
		 * MoveToButtons are visible while GamePiece is 
		 * moving to new space
		 * 
		 * 5:------------------- RESOLVED
		 * GamePiece normal Image still visible after taken
		 * Should be not be visible
		 * 
		 * 6:------------------- RESOLVED
		 * Completed game with Orange winning. Reset game 
		 * via ResetGameButton in Menu. GamePiece normal Image 
		 * was visible for both players. Should only be visible 
		 * for whoevers turn it is.
		 * 
		 * 7:------------------- 
		 * There's a situation you can get in where it's 
		 * impossible to finish the game. If both players 
		 * have the right X GamePieces left, they can't 
		 * take eachother.
		 * 		The mechanics/rules of the game would 
		 * 		have to change to fix this.
		 * 		An easy fix would to just leave it as is 
		 * 		and the players would have to reset the 
		 * 		game.
		 * 
		 * 8:------------------- 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		*/
		
		
		public function BugNotes() 
		{
			
		}
		
	}

}