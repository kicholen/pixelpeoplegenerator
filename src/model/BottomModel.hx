package model;
import utils.ColorConverter;
import utils.Mode;
import utils.Utils;

/**
 * ...
 * @author zelek
 */
class BottomModel
{
	private var _bootsColor:UInt;
	private var _clothColor:Array<Array<UInt>>;
	private var _isShort:Bool;
	
	public function new() {
		_clothColor = [for (x in 0...12) [for (y in 0...12) 0]];
	}
	
	public function randomize(mode:Mode):Void {
		_bootsColor = mode == Mode.Crazy ? Utils.getRandomColor() : 0x000000;
		//_clothColor = Utils.getRandomColor();
		Utils.createRandomColorPallete(_clothColor, ColorConverter.rgb2hsl(ColorConverter.toRGB(Utils.getRandomColor())));
		_isShort = Math.random() > 0.9;
	}
	
	public function getBootsColor():UInt {
		return _bootsColor;
	}
	
	public function getClothColor(x:Int, y:Int):UInt {
		return _clothColor[x][y];
	}
	
	public function isShort() {
		return _isShort;
	}
	
}