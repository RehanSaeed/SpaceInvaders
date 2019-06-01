_global.iDepth = 100;
_global.time = 0;

var player:Player = new Player(makeSprite("mShip"), 10, 0, 5, 20);

var enemyMap:EnemiesMap = new EnemiesMap();
var enemiesList:Array = new Array();

var bulletList:Array = new Array();

// function: init
// Set up the keyboard and tick handlers for the game
function init()
{
	_level0.onEnterFrame = handleTick;
	_level0.onKeyDown = handleKeyDown;
	Key.addListener(_level0);
}

// function: makeSprite
// Given the export tag of a movie clip in the flash file's library, create
// a sprite. Clips are created on top of others. 
function makeSprite(sTag:String):MovieClip
{
	var mClip:MovieClip;
	var sName:String = "clip"+iDepth;
	mClip = _level0.attachMovie(sTag,sName,iDepth);
	iDepth++;
	return(mClip);
}

// function: handleTick
// Called every frame. 
function handleTick()
{
	//Update the player
	player.updatePlayer();
	
	//Add enemies to the map
	iDepth = enemyMap.checkMap(time, iDepth, enemiesList);
	
	//Move the enemies according to their move type and detect collissions
	var tempEnemies:Array = new Array();
	var tempBullets:Array = new Array();
	for (var i:Number = 0; i < enemiesList.length; ++i)
	{
		//Move all enemies
		enemiesList[i].moveEnemy();
		enemiesList[i].updateEnemy();
		
		if (enemiesList[i].canFire())
		{
			var bullet:Bullet = new Bullet(makeSprite("mBulletEnemy"), false, 4);
			bullet.getMovieClip()._x = enemiesList[i].getMovieClip()._x;
			bullet.getMovieClip()._y = enemiesList[i].getMovieClip()._y + (enemiesList[i].getMovieClip()._height * 1.5);
			bulletList.push(bullet);
			enemiesList[i].setFireCounter(0);
		}
		
		//Check for collissions between player and enemies.
		if (player.getMovieClip().hitTest(enemiesList[i].getMovieClip()))
		{
			//Player has collided with enemy
			player.decrementLives();
			player.setScore(player.getScore() + enemiesList[i].getScore());
			enemiesList[i].getMovieClip().removeMovieClip();
			enemiesList[i] = null;
		}
		else if (enemiesList[i]._y > Stage.height)
		{
			//If the enemy is off the stage 
			player.setScore(player.getScore() - enemiesList[i].getScore());
			enemiesList[i].getMovieClip().removeMovieClip();
			enemiesList[i] = null;
		}

		
		//Move all the bullets and check for collissions
		for (var j:Number = 0; j < bulletList.length; ++j)
		{
			//If bullet has gone off the stage, get rid of it
			if ((bulletList[j].getMovieClip()._y < 0) || (bulletList[j].getMovieClip()._y > Stage.height))
			{
				bulletList[j].getMovieClip().removeMovieClip();
				bulletList[j] = null;
			}
			else
			{
				//Detect collissions between player, enemies and bullets
				//If the bullet came from the player
				if (bulletList[j].getPlayerBullet())
				{
					//If the enemy is not already dead
					if (enemiesList[i] != null)
					{
						//If bullet collides with enemy
						if (bulletList[j].getMovieClip().hitTest(enemiesList[i].getMovieClip()))
						{
							bulletList[j].getMovieClip().removeMovieClip();
							bulletList[j] = null;
							player.setScore(player.getScore() + enemiesList[i].getScore());
							enemiesList[i].getMovieClip().removeMovieClip();
							enemiesList[i] = null;
						}
					}
				}
				else
				{
					//The bullet came from the enemy
					//If bullet collides with player
					if (player.getMovieClip().hitTest(bulletList[j].getMovieClip()))
					{
						//Destroy bullet
						bulletList[j].getMovieClip().removeMovieClip();
						bulletList[j] = null;
						//Decrease lives and score
						player.decrementLives();
						player.setScore(player.getScore() + enemiesList[i].getScore());
					}
				}
			}
		}
		//If the enemy has survived save it
		if (enemiesList[i] != null)
		{
			tempEnemies.push(enemiesList[i]);
		}
	}
	//For each bullet that has survived move it
	for (var i:Number = 0; i < bulletList.length; ++i)
	{
		if (bulletList[i] != null)
		{
			//If it is the players bullet move bullet up
			if (bulletList[i].getPlayerBullet())
			{
				bulletList[i].getMovieClip()._y = bulletList[i].getMovieClip()._y - bulletList[i].getBulletSpeed();
			}
			else
			{
				//Bullet came from enemy
				bulletList[i].getMovieClip()._y = bulletList[i].getMovieClip()._y + bulletList[i].getBulletSpeed();
			}
			tempBullets.push(bulletList[i]);
		}
	}
	enemiesList = tempEnemies;
	bulletList = tempBullets;
	
	//Set the players score
	if (player.getLives() > 0)
	{
		_level0.mScore.text = "TIME: " + time + "  SCORE: "+ player.getScore() + "  LIVES: " + player.getLives();
	}
	else
	{
		_level0.mScore.text = "GAME OVER";
	}
	//Increment the time
	++time;
}

// function: handleKeyDown
// Called when a key is pressed.
function handleKeyDown()
{
	if (player.getLives() > 0)
	{
		//Up Pressed
		if ((Key.getCode() == 38) && (player.getMovieClip()._y > player.getMovieClip()._height))
		{
			player.getMovieClip()._y = player.getMovieClip()._y - player.getMoveSpeed();
		}
		//Down Pressed
		if ((Key.getCode() == 40) && (player.getMovieClip()._y < (Stage.height - player.getMovieClip()._height)))
		{
			player.getMovieClip()._y =  player.getMovieClip()._y + player.getMoveSpeed();
		}
		//If Pressed
		if ((Key.getCode() == 37) && (player.getMovieClip()._x > player.getMovieClip()._width))
		{
			player.getMovieClip()._x = player.getMovieClip()._x - player.getMoveSpeed();
		}
		//Right Pressed
		if ((Key.getCode() == 39) && (player.getMovieClip()._x < (Stage.width - player.getMovieClip()._width)))
		{
			player.getMovieClip()._x = player.getMovieClip()._x + player.getMoveSpeed();
		}
		//Spacebar Pressed
		if (Key.getCode() == 32)
		{
			//Fire
			if (player.canFire())
			{
				var bullet:Bullet = new Bullet(makeSprite("mBullet"), true, 4);
				bullet.getMovieClip()._x = player.getMovieClip()._x;
				bullet.getMovieClip()._y = player.getMovieClip()._y - (player.getMovieClip()._height * 1.5);
				bulletList.push(bullet);
				player.setFireCounter(0);
			}
		}
	}
}

init();
