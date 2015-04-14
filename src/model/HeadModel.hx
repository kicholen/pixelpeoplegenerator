package model;


import openfl.geom.Point;
import utils.Mode;
import utils.Utils;
/**
 * ...
 * @author zelek
 */
class HeadModel
{
	private var _hairColors:Map<Int, UInt>;
	private var _hairCount:Int;
	public var hairFunctionsCount:Int;
	public var hairColor:UInt;
	public var eyesColor:UInt;
	public var eyesGlowLightness:Float;
	public var hairBaseOffset:Int;
	
	public function new() {
		createHairColors();
	}
	
	public function randomize(mode:Mode) {
		eyesColor = mode == Mode.Crazy ? Utils.getRandomColor() : 0x000000;
		hairColor = mode == Mode.Crazy ? Utils.getRandomColor() : _hairColors.get(Utils.getRandomInt(0, _hairCount - 1));
		hairFunctionsCount = Utils.getRandomInt(1, 4);
		hairBaseOffset = Math.random() > 0.5 ? 1 : 0;
		eyesGlowLightness = utils.Utils.getRandomInt(80, 100) / 100;
	}
	
	public function createHairColors() {
		_hairColors = new Map<Int, UInt>();
		_hairCount = 0;
		_hairColors.set(_hairCount++, 0x090806);
		_hairColors.set(_hairCount++, 0x2C222B);
		_hairColors.set(_hairCount++, 0x71635A);
		_hairColors.set(_hairCount++, 0xB7A69E);
		_hairColors.set(_hairCount++, 0xD6C4C2);
		_hairColors.set(_hairCount++, 0xCABFB1);
		_hairColors.set(_hairCount++, 0xDCD0BA);
		_hairColors.set(_hairCount++, 0xFFF5E1);
		_hairColors.set(_hairCount++, 0xE6CEA8);
		_hairColors.set(_hairCount++, 0xE5C8A8);
		_hairColors.set(_hairCount++, 0xDEBC99);
		_hairColors.set(_hairCount++, 0xB89778);
		_hairColors.set(_hairCount++, 0xA56B46);
		_hairColors.set(_hairCount++, 0xB55239);
		_hairColors.set(_hairCount++, 0x8D4A43);
		_hairColors.set(_hairCount++, 0x91553D);
		_hairColors.set(_hairCount++, 0x533D32);
		_hairColors.set(_hairCount++, 0x3B3024);
		_hairColors.set(_hairCount++, 0x554838);
		_hairColors.set(_hairCount++, 0x4E433F);
		_hairColors.set(_hairCount++, 0x504444);
		_hairColors.set(_hairCount++, 0x6A4E42);
		_hairColors.set(_hairCount++, 0xA7856A);
		_hairColors.set(_hairCount++, 0x977961);
	}
	
}