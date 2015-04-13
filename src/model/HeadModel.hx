package model;


import openfl.geom.Point;
import utils.Utils;
/**
 * ...
 * @author zelek
 */
class HeadModel
{
	public var headSize:Point;
	public var hairSize:Point;
	public var hairColor:UInt;
	public var eyesColor:UInt;
	public var eyesGlowLightness:Float;
	
	public function new() {
		
	}
	
	public function randomize() {
		eyesColor = utils.Utils.rgbToHex(utils.Utils.getRandomInt(0, 255), utils.Utils.getRandomInt(0, 255), utils.Utils.getRandomInt(0, 255));
		eyesGlowLightness = utils.Utils.getRandomInt(80, 100) / 100;
	}
	
	public function getEyeColor():UInt {
		return eyesColor;
	}
	
	public function getEyeGlowLightness():Float {
		return eyesGlowLightness;
	}
}