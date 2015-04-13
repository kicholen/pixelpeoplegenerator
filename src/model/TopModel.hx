package model;
import utils.Utils;

/**
 * ...
 * @author zelek
 */
class TopModel
{
	private var _clothColor:UInt;
	private var _isShort:Bool;
	
	public function new() {
		
	}
	
	public function randomize():Void {
		_clothColor = Utils.getRandomColor();
		_isShort = Math.random() > 0.9;
	}
	
	public function getClothColor():UInt {
		return _clothColor;
	}
	
	public function isShort() {
		return _isShort;
	}
}