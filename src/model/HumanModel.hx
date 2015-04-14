package model;
import haxe.ds.Vector;
import model.HeadModel;
import model.BottomModel;
import openfl.geom.Point;
import openfl.utils.Dictionary;
import utils.ColorConverter;
import utils.Mode;
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
	
	private var _skinColors:Vector<Int>;
	private var _skinColor:UInt;
	private var _sex:Sex;
	private var _skinCount:Int;
	
	public function new() {
		head = new HeadModel();
		bottom = new BottomModel();
		top = new TopModel();
		createSkinColors();
	}
	
	public function randomize(mode:Mode):Void {
		_skinColor = getRandomSkinColor();
		_sex = Math.random() > 0.5 ? Sex.Female : Sex.Male;
		head.randomize(mode);
		bottom.randomize(mode);
		top.randomize();
	}
	
	
	public function getSkinColor():UInt {
		return _skinColor;
	}
	
	private function getRandomSkinColor() {
		return _skinColors.get(Utils.getRandomInt(0, _skinCount - 1));
	}
	
	private function createSkinColors() {
		_skinColors = new Vector<Int>(50);
		_skinCount = 0;
		_skinColors.set(_skinCount, Utils.rgbToHex(255, 223, 196));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(255, 220, 170));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(253, 228, 200));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(240, 213, 190));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(240, 200, 201));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(238, 206, 179));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(234, 189, 157));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(231, 158, 109));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(229, 194, 152));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(229, 184, 143));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(229, 160, 115));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(227, 194, 124));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(225, 184, 153));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(224, 177, 132));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(223, 166, 117));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(222, 171, 127));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(221, 168, 160));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(219, 144, 101));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(208, 146, 110));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(206, 150, 124));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(203, 132, 66));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(198, 120, 86));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(189, 114, 60));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(186, 108, 73));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(185, 124, 109));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(173, 100, 82));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(168, 117, 108));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(165, 114, 87));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(165, 57, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(163, 134, 106));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(148, 10, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(135, 4, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(123, 0, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(123, 0, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(113, 0, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(112, 65, 57));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(100, 25, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(92, 56, 54));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(90, 0, 1));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex( 67, 0, 0 ));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex(56, 0, 0));
		_skinCount += 1;
		_skinColors.set(_skinCount, Utils.rgbToHex( 48, 46, 46 ));
		_skinCount += 1;
	}
}