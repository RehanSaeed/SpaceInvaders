class Player
{
	private var mShip:MovieClip;
	private var score:Number;
	private var lives:Number;
	private var moveSpeed:Number;
	
	private var fireDelay:Number;
	private var fireCounter:Number;
	
	//Player constructor requires:
	//1) MovieClip - The movie clip of the player
	//2) Lives - The number of lives the player has.
	//3) Score the players score.
	//4) Move Speed - The speed at which the player moves.
	//5) The delay between firing.
	public function Player(mShip:MovieClip, lives:Number, score:Number, 
						   moveSpeed:Number, fireDelay:Number)
	{
		this.mShip = mShip;
		this.score = score;
		this.lives = lives;
		this.moveSpeed = moveSpeed;
		this.fireDelay = fireDelay;
		fireCounter = fireDelay;
		mShip._x = Stage.width/2;
		mShip._y = Stage.height - mShip._height;
		
		//Allow the player to be draggable
		mShip.onPress = function() 
		{
    		startDrag(this);
		};
		mShip.onRelease = function() 
		{
    		stopDrag();
		};
	}
	
	//Update the players fire counter.
	public function updatePlayer() :Void
	{
		++fireCounter;
	}
	
	//Returns whether or not the player can fire.
	public function canFire() :Boolean
	{
		if (fireCounter > fireDelay)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//returnt he score.
	public function getScore() :Number
	{
		return score;
	}
	
	//return the fire counter which counts up from last firing.
	public function getFireCounter() :Number
	{
		return fireCounter;
	}
	
	//set the fire counter which counts up from last firing.
	public function setFireCounter(fireCounter:Number) :Void
	{
		this.fireCounter = fireCounter;
	}
	
	//Return the fire delay between firing.
	public function getFireDelay() :Number
	{
		return fireDelay;
	}
	
	//Set the score.
	public function setScore(score:Number) :Void
	{
		this.score = score;
	}
	
	//return move speed
	public function getMoveSpeed() :Number
	{
		return moveSpeed;
	}
	
	//Set the move speed.
	public function setMoveSpeed(moveSpeed:Number) :Void
	{
		this.moveSpeed = moveSpeed;
	}
	
	//Return the lives.
	public function getLives() :Number
	{
		return lives;
	}
	
	//Set the lives.
	public function setLives(l:Number) :Void
	{
		lives = l;
	}
	
	//increment lives by one.
	public function incrementLives() :Void
	{
		++lives;
	}
	
	//decrement lives by one.
	public function decrementLives() :Void
	{
		--lives;
	}
	
	//return the movie clip.
	public function getMovieClip() :MovieClip
	{
		return mShip;
	}
}