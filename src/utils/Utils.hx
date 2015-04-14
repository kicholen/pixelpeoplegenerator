package utils;
import utils.ColorConverter.HSL;
import utils.ColorConverter.RGB;

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

	public static function createRandomColorPallete(palette:Array<Array<UInt>>, hsl:HSL, shouldRandomize:Bool = false) {
		for (i in 0...palette.length) {
			for (j in 0...palette[0].length) {
				hsl.l *= 0.99;
				var rgbColor:RGB = ColorConverter.hsl2rgb(hsl);
				if (shouldRandomize && Math.random() > 0.8) {
					palette[i][j] = getRandomColor();
				}
				else {
					palette[i][j] = ColorConverter.toInt(rgbColor);
				}
			}
			hsl.s *= 0.99;
		}
	}
}