class Enemy
{
	private var mShip:MovieClip;
	private var lives:Number;
	private var shoot:Boolean;
	private var score:Number;
	
	private var moveType:Number;
	private var moveSpeed:Number;
	
	private var pointReached:Boolean = false;
	
	private var fireDelay:Number;
	private var fireCounter:Number;
	
	//Enemy constructor which requires:
	//1) Movie clip - for the enemy
	//2) Lives - The number of lives the enemy has
	//3) Shoot - Whether or not the enemy has the ability to shoot or not.
	//4) Score - The score given to the player if the enemy is killed.
	//5) MoveType - The path the enemy should move on.
	//6) MoveSpeed - The speed at which the enemy should move.
	//7) startX - The starting x position.
	//8) startY - The starting y position.
	//9) FireDelay - The delay between firing.
	public function Enemy(mShip:MovieClip, lives:Number, shoot:Boolean, score:Number,
						  moveType:Number, moveSpeed:Number, startX:Number, 
						  startY:Number, fireDelay:Number)
	{
		this.mShip = mShip;
		this.lives = lives;
		this.shoot = shoot;
		this.score = score;
		this.moveType = moveType;
		this.moveSpeed = moveSpeed;
		this.mShip._x = startX;
		this.mShip._y = startY;
		this.fireDelay = fireDelay;
		fireCounter = fireDelay;
	}
	
	//Update the enemies counter before he can fire again.
	public function updateEnemy()
	{
		++fireCounter;
	}
	
	//Return a boolean value which shows if the enemy can fire or not.
	public function canFire()
	{
		if ((fireCounter > fireDelay) && shoot)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//Set the Counter before the enemy can fire.
	public function setFireCounter(fireCounter:Number) :Void
	{
		this.fireCounter = fireCounter;
	}
	
	//Return whether or not the enemy has the ability to shoot.
	public function getShoot() :Boolean
	{
		return shoot;
	}
	
	//Return the score given to the player by this enemy.
	public function getScore() :Number
	{
		return score;
	}
	
	//Set the score to a given value.
	public function setScore(score:Number) :Void
	{
		score = score;
	}
	
	//Set the number of lives the enemy has.
	public function setLives(l:Number) :Void
	{
		lives = l;
	}
	
	//Increment the number of lives the enemy has.
	public function incrementLives() :Void
	{
		++lives;
	}
	
	//Decrement the number of lives the enemy has.
	public function decrementLives() :Void
	{
		--lives;
	}
	
	//Retuen the Movie Clip
	public function getMovieClip() :MovieClip
	{
		return mShip;
	}
	
	//Move the enemy depending upon the movetype of the enemy.
	public function moveEnemy() :Void
	{
		//Move left to right and back again.
		if (moveType == 0)
		{
			if (mShip._x < (Stage.width - mShip._width) && (pointReached == false))
			{
				mShip._x = mShip._x + moveSpeed;
			}
			else 
			{
				pointReached = true;
			}
			if ((mShip._x > mShip._width) && (pointReached == true))
			{
				mShip._x = mShip._x - moveSpeed;
			}
			else
			{
				pointReached = false;
			}
		}
		else if (moveType == 1)
		{
			if (mShip._x < (Stage.width - mShip._width) && (pointReached == false))
			{
				mShip._x = mShip._x + moveSpeed;
			}
			else if (mShip._x >= (Stage.width - mShip._width) && (pointReached == false))
			{
				pointReached = true;
				mShip._y = mShip._y + (mShip._height * 1.5);
			}
			else if ((mShip._x > mShip._width) && (pointReached == true))
			{
				mShip._x = mShip._x - moveSpeed;
			}
			else if ((mShip._x <= mShip._width) && (pointReached == true))
			{
				pointReached = false;
				mShip._y = mShip._y + (mShip._height * 1.5);
			}
		}
	}
}