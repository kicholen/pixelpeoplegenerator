package model;
import model.HeadModel;
import model.BottomModel;
import openfl.geom.Point;
import utils.Utils;

/**
 * ...
 * @author zelek
 */
class HumanModel
{
	public var head:HeadModel;
	public var top:TopModel;
	public var bottom:BottomModel;
	
	private var _skinColor:UInt;
	private var _sex:Sex;
	
	public function new() {
		head = new HeadModel();
		bottom = new BottomModel();
	}
	
	public function randomize():Void {
		_skinColor = Utils.getRandomColor();
		_sex = Math.random() > 0.5 ? Sex.Female : Sex.Male;
		head.randomize();
		bottom.randomize(_sex);
	}
	
	public function getSkinColor():UInt {
		return _skinColor;
	}
	
}