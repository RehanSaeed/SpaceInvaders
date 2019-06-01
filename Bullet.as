class Bullet
{
	private var mBullet:MovieClip;
	private var playerBullet:Boolean;
	private var bulletSpeed:Number;
	
	public function Bullet(mBullet:MovieClip, playerBullet:Boolean, bulletSpeed:Number)
	{
		this.mBullet = mBullet;
		this.playerBullet = playerBullet;
		this.bulletSpeed = bulletSpeed;
	}
	
	public function getMovieClip() :MovieClip
	{
		return mBullet;
	}
	
	public function getPlayerBullet() :Boolean
	{
		return playerBullet;
	}
	
	public function getBulletSpeed() :Number
	{
		return bulletSpeed;
	}
}