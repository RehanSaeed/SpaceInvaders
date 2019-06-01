class EnemiesMap
{
	private var enemyMap:Array;
	private var level:Number;
	private var levelChanged:Boolean;
	private var cumalativeTime:Number;
	
	//Enemies map constructor which requires a map number to be used to select which map to use.
	public function EnemiesMap()
	{
		level = 0;
		setMap(level);
		levelChanged = false;
		cumalativeTime = 0;
	}
	
	//Given a map number select a map.
	//1) Entry Time - The entry time of the enemy.
	//2) Movie Clip type - The movie clip type
	//						0 - mBaddie1
	//						1 - mBaddie2
	//						2 - mBaddie3
	//3) Lives - The number of lives the enemy has.
	//4) Shoot (Boolean) - Whether or not the enemy has the ability to shoot.
	//5) Score - The score of the enemy.
	//6) Move Type - The path the enemy can move on.
	//7) Move Speed - The speed at which the enemy can move.
	//8) Start X - The starting x position.
	//9) Start Y - The starting y position.
	//10) Fire Delay - The delay between firing
	public function setMap(mapNumber:Number)
	{
		if (mapNumber == 0)
		{
			enemyMap = new Array(
								 //Line 1
								 new Array(100, 0, 1, false, 10, 1, 3, 50, 50, 50), 
								 new Array(120, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(140, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(160, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(180, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(200, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(220, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(240, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(260, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 //Line 2
								 new Array(280, 0, 1, false, 10, 1, 3, 50, 50, 50), 
								 new Array(300, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(320, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(340, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(360, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(380, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(400, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(420, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(440, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 //Line 3
								 new Array(460, 0, 1, false, 10, 1, 3, 50, 50, 50), 
								 new Array(480, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(500, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(520, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(540, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(560, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(580, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(600, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 new Array(620, 0, 1, false, 10, 1, 3, 50, 50, 50),
								 //Line 4 - Boss 1
								 new Array(640, 1, 1, true, 10, 0, 3, 50, 50, 100), 
								 //NEW LEVEL
								 new Array(660, -1, 0, false, 0, 0, 0, 0, 0, 0)
								 );
		}
		else if (mapNumber == 1)
		{
			enemyMap = new Array(
								 //Line 1
								 new Array(100, 0, 1, false, 10, 1, 6, 50, 50, 50), 
								 new Array(110, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(120, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(130, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(140, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(150, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(160, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(170, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(180, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 //Line 2
								 new Array(190, 0, 1, false, 10, 1, 6, 50, 50, 50), 
								 new Array(200, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(210, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(220, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(230, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(240, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(250, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(260, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 new Array(270, 0, 1, false, 10, 1, 6, 50, 50, 50),
								 //Line 3
								 new Array(280, 1, 1, false, 20, 1, 6, 50, 50, 50), 
								 new Array(290, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(300, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(310, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(320, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(330, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(340, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(350, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 new Array(360, 1, 1, false, 20, 1, 6, 50, 50, 50),
								 //Line 4 - Boss 1
								 new Array(380, 2, 1, true, 30, 0, 10, 50, 50, 30), 
								 //NEW LEVEL
								 new Array(400, -1, 0, false, 0, 0, 0, 0, 0, 0) 
								 );
		}
		else if (mapNumber == 2)
		{
			enemyMap = new Array(
								 //Line 1
								 new Array(100, 0, 1, false, 10, 1, 10, 50, 50, 50), 
								 new Array(110, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(120, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(130, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(140, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(150, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(160, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(170, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(180, 0, 1, false, 10, 1, 10, 50, 50, 50),
								 //Line 2
								 new Array(190, 1, 1, false, 10, 1, 10, 50, 50, 50), 
								 new Array(200, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(210, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(220, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(230, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(240, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(250, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(260, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 new Array(270, 1, 1, false, 10, 1, 10, 50, 50, 50),
								 //Line 3
								 new Array(280, 2, 1, true, 10, 1, 10, 50, 50, 81), 
								 new Array(290, 2, 1, true, 10, 1, 10, 50, 50, 79),
								 new Array(300, 2, 1, true, 10, 1, 10, 50, 50, 73),
								 new Array(310, 2, 1, true, 10, 1, 10, 50, 50, 72),
								 new Array(320, 2, 1, true, 10, 1, 10, 50, 50, 80),
								 new Array(330, 2, 1, true, 10, 1, 10, 50, 50, 79),
								 new Array(340, 2, 1, true, 10, 1, 10, 50, 50, 84),
								 new Array(350, 2, 1, true, 10, 1, 10, 50, 50, 85),
								 new Array(360, 2, 1, true, 10, 1, 10, 50, 50, 75),
								 //Line 4 - Boss 1
								 new Array(380, 2, 1, true, 10, 0, 20, 50, 50, 41), 
								 //NEW LEVEL
								 new Array(400, -1, 0, false, 0, 0, 0, 0, 0, 0) 
								 );
		}
	}
	
	//Check the map to see if there are any new enemies to be added to the map.
	//Given the time, depth and list of enemies.
	public function checkMap(time:Number, iDepth:Number, enemiesList:Array) :Number
	{
		if (levelChanged == false)
		{
			//For each item in the map
			for (var i:Number = 0; i < enemyMap.length; ++i)
			{
				//If the items time has been reached
				if (time == (enemyMap[i][0] + cumalativeTime))
				{
					//If the item is a new level
					if (enemyMap[i][1] == -1)
					{
						levelChanged = true;
						cumalativeTime = cumalativeTime + enemyMap[i][0]
						trace("CTIME " + cumalativeTime);
						trace("TIME " + time);
					}
					else
					{
						var enemyType:String;
						if (enemyMap[i][1] == 0)
						{
							enemyType = "mBaddie1"
						}
						else if (enemyMap[i][1] == 1)
						{
							enemyType = "mBaddie2"
						}
						else if (enemyMap[i][1] == 2)
						{
							enemyType = "mBaddie3"
						}
						
						var sName:String = "clip"+iDepth;
						enemiesList.push(new Enemy(_level0.attachMovie(enemyType,sName,iDepth), enemyMap[i][2], 
									enemyMap[i][3], enemyMap[i][4], enemyMap[i][5], 
									enemyMap[i][6], enemyMap[i][7], enemyMap[i][8], enemyMap[i][9]));
						++iDepth;
					}
				}

			}
		}
		if ((enemiesList.length == 0) && (levelChanged == true))
		{
			trace(level);
			++level;
			setMap(level);
			trace(level);
			levelChanged = false;
		}
		return iDepth;
	}
}