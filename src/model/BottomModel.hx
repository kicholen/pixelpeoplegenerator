package model;
import utils.Utils;

/**
 * ...
 * @author zelek
 */
class BottomModel
{
	private var _bootsColor:UInt;
	private var _clothColor:UInt;
	private var _isShort:Bool;
	
	public function new() {
		
	}
	
	public function randomize(sex:Sex):Void {
		_bootsColor = Utils.getRandomColor();
		_clothColor = Utils.getRandomColor();
		_isShort = Math.random() > 0.9;
	}
	
	public function getBootsColor():UInt {
		return _bootsColor;
	}
	
	public function getClothColor():UInt {
		return _clothColor;
	}
	
	public function isShort() {
		return _isShort;
	}
	
}