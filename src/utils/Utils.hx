package utils;

/**
 * ...
 * @author zelek
 */
class Utils
{
	public static function getRandomInt(low:Int, high:Int):Int {
		return Math.floor(Math.random() * (1 + high - low)) + low;
	}
	
	public static function getRandomColor():UInt {
		return rgbToHex(utils.Utils.getRandomInt(0, 255), utils.Utils.getRandomInt(0, 255), utils.Utils.getRandomInt(0, 255));
	}
	
	public static function rgbToHex(r:UInt, g:UInt, b:UInt):UInt {
		return (255 & 0xFF) << 24 | (r & 0xFF) << 16 | (g & 0xFF) << 8 | (b & 0xFF);
	}

}