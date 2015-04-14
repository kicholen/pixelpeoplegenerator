package model;
import utils.ColorConverter;
import utils.Utils;

/**
 * ...
 * @author zelek
 */
class TopModel
{
	public var topFunctionsCount:Int;
	private var _clothColor:Array<Array<UInt>>;
	private var _isShort:Bool;
	
	public function new() {
		_clothColor = [for (x in 0...12) [for (y in 0...12) 0]];
	}
	
	public function randomize():Void {
		Utils.createRandomColorPallete(_clothColor, ColorConverter.rgb2hsl(ColorConverter.toRGB(Utils.getRandomColor())), Math.random() > 0.2 ? true : false);
		_isShort = Math.random() > 0.9;
		topFunctionsCount = Utils.getRandomInt(1, 4);
	}
	
	public function getClothColor(x:Int, y:Int):UInt {
		return _clothColor[x][y];
	}
	
	public function isShort() {
		return _isShort;
	}
	
	
}