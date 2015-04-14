package src;

import utils.ColorConverter;
import model.HumanModel;
import model.HumanBaseParameters;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import utils.Mode;
import utils.Utils;
/**
 * ...
 * @author zelek
 */
class HumanFactory
{
	private var _model:HumanModel;
	private var _hairStylesMap:Map<Int, BitmapData->Void>;
	private var _topStylesMap:Map<Int, BitmapData->Void>;
	private var _hairMapLength:Int;
	private var _topMapLength:Int;
	private var _mode:Mode;
	
	public function new() {
		_mode = Mode.Normal;
		_model = new HumanModel();
		_hairStylesMap = new Map<Int, BitmapData->Void>();
		createHairFunctionsMap();
		_topStylesMap = new Map<Int, BitmapData->Void>();
		createTopFunctionsMap();
	}
	
	public function createRandomHuman():Bitmap {
		createRandomModel();
		
		return new Bitmap(createBitmapDataFromModel(_model));
	}
	
	public function changeMode():Void {
		_mode = _mode == Mode.Normal ? Mode.Crazy : Mode.Normal;
	}
	
	private function createRandomModel():Void {
		_model.randomize(_mode);
	}
	
	private function createBitmapDataFromModel(model:HumanModel):BitmapData {
		var bitmapData:BitmapData = new BitmapData(HumanBaseParameters.WIDTH, HumanBaseParameters.HEIGHT, true, 0);
		
		bitmapData.lock();
		drawBody(bitmapData);
		drawEyes(bitmapData);
		drawHair(bitmapData);
		drawBottom(bitmapData);
		drawTop(bitmapData);
		
		bitmapData.unlock();
		
		return bitmapData;
	}
	
	private function drawHair(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		var xOffset:Int = _model.head.hairBaseOffset;
		
		switch(_model.top.topFunctionsCount) {
			case 1:
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
			case 2:
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
			case 3:
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
			case 4:
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
				_hairStylesMap.get(Utils.getRandomInt(0, _hairMapLength - 1)).bind(bitmapData)();
		}
		
		drawBaseHair(bitmapData, xOffset);
	}
	
	private function drawLongFirst(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(0, 2, color);
		bitmapData.setPixel(1, 0, color);
		drawMediumBack(bitmapData);
		drawMediumFront(bitmapData);
	}
	
	private function drawLongSecond(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(0, 2, color);
		bitmapData.setPixel(1, 0, color);
		bitmapData.setPixel(1, 4, color);
		bitmapData.setPixel(1, 5, color);
		drawMediumBack(bitmapData);
		drawMediumFront(bitmapData);
	}
	
	private function drawLongThird(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(0, 2, color);
		bitmapData.setPixel(1, 0, color);
		drawMediumBack(bitmapData);
		drawMediumFront(bitmapData);
	}
	
	private function drawMediumBack(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(0, 3, color);
		bitmapData.setPixel(0, 4, color);
		bitmapData.setPixel(0, 5, color);
	}
	
	private function drawMediumFront(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(2, 0, color);
		bitmapData.setPixel(3, 0, color);
		bitmapData.setPixel(4, 0, color);
	}
	
	private function drawShortBackFirst(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(0, 1, color);
		bitmapData.setPixel(1, 1, color);
		bitmapData.setPixel(1, 0, color);
	}
	
	private function drawShortBackSecond(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(4, 1, color);
	}
	
	private function drawShortBackThird(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(1, 3, color);
	}
	
	private function drawShortFrontFirst(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(5, 1, color);
		bitmapData.setPixel(6, 1, color);
	}
	
	private function drawShortFrontSecond(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(5, 1, color);
		bitmapData.setPixel(6, 2, color);
	}
	
	private function drawShortFrontThird(bitmapData:BitmapData):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(5, 1, color);
		bitmapData.setPixel(5, 0, color);
	}
	
	private function drawBaseHair(bitmapData:BitmapData, xOffset:Int):Void {
		var color:UInt = _model.head.hairColor;
		bitmapData.setPixel(1 + xOffset, 1, color);
		bitmapData.setPixel(2 + xOffset, 1, color);
		bitmapData.setPixel(3 + xOffset, 1, color);
		bitmapData.setPixel(4 + xOffset, 1, color);
		
		bitmapData.setPixel(0 + xOffset, 2, color);
		bitmapData.setPixel(1 + xOffset, 2, color);
		
		bitmapData.setPixel(0 + xOffset, 3, color);
	}
	
	private function drawTop(bitmapData:BitmapData) {
		if (!_model.top.isShort()) {
			bitmapData.setPixel(1, 5, _model.top.getClothColor(1, 7));
			bitmapData.setPixel(1, 6, _model.top.getClothColor(1, 7));
			bitmapData.setPixel(1, 7, _model.top.getClothColor(1, 7));
		}
		drawBaseTop(bitmapData);
		
		switch(_model.top.topFunctionsCount) {
			case 1:
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
			case 2:
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
			case 3:
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
			case 4:
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
				_topStylesMap.get(Utils.getRandomInt(0, _topMapLength - 1)).bind(bitmapData)();
		}
	}
	
	private function drawBaseTop(bitmapData:BitmapData):Void {
		for (i in 2...5) {
			for (j in 5...9) {
				bitmapData.setPixel(i, j, _model.top.getClothColor(i, j));
			}
		}
	}
	
	private function drawTopFirst(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 5, _model.top.getClothColor(1, 5));
		bitmapData.setPixel(2, 5, _model.top.getClothColor(2, 5));
		bitmapData.setPixel(3, 5, _model.top.getClothColor(3, 5));
		bitmapData.setPixel(4, 5, _model.top.getClothColor(4, 5));
	}
	
	private function drawTopSecond(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 6, _model.top.getClothColor(1, 6));
		bitmapData.setPixel(2, 6, _model.top.getClothColor(2, 6));
		bitmapData.setPixel(3, 6, _model.top.getClothColor(3, 6));
		bitmapData.setPixel(4, 6, _model.top.getClothColor(4, 6));
	}
	
	private function drawTopThird(bitmapData:BitmapData):Void {
		bitmapData.setPixel(2, 7, _model.top.getClothColor(2, 7));
		bitmapData.setPixel(3, 7, _model.top.getClothColor(3, 7));
		bitmapData.setPixel(4, 7, _model.top.getClothColor(4, 7));
	}
	
	private function drawTopFourth(bitmapData:BitmapData):Void {
		bitmapData.setPixel(2, 8, _model.top.getClothColor(2, 8));
		bitmapData.setPixel(3, 8, _model.top.getClothColor(3, 8));
		bitmapData.setPixel(4, 8, _model.top.getClothColor(4, 8));
	}
	
	private function drawBottom(bitmapData:BitmapData):Void {
		drawBoots(bitmapData);
		
		drawBottomFirst(bitmapData);
		drawBottomSecond(bitmapData);
	}
	
	private function drawBottomFirst(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 9, _model.bottom.getClothColor(1, 9));
		bitmapData.setPixel(2, 9, _model.bottom.getClothColor(2, 9));
		bitmapData.setPixel(3, 9, _model.bottom.getClothColor(3, 9));
		bitmapData.setPixel(4, 9, _model.bottom.getClothColor(4, 9));
	}
	
	private function drawBottomSecond(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 10, _model.bottom.getClothColor(1, 10));
		bitmapData.setPixel(4, 10, _model.bottom.getClothColor(4, 10));
	}
	
	private function drawBoots(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 11, _model.bottom.getBootsColor());
		bitmapData.setPixel(4, 11, _model.bottom.getBootsColor());
	}
	
	private function drawEyes(bitmapData:BitmapData):Void {
		var hsl = utils.ColorConverter.rgb2hsl(utils.ColorConverter.toRGB(bitmapData.getPixel(1, 3)));
		hsl.l *= _model.head.eyesGlowLightness;
		var darkerColor = utils.ColorConverter.toInt(utils.ColorConverter.hsl2rgb(hsl));
		
		bitmapData.setPixel(2, 3, darkerColor);
		bitmapData.setPixel(4, 3, darkerColor);
		
		bitmapData.setPixel(3, 3, _model.head.eyesColor);
		bitmapData.setPixel(5, 3, _model.head.eyesColor);
	}
	
	private function drawBody(bitmapData:BitmapData):Void {
		drawHead(bitmapData);
		drawTorso(bitmapData);
		drawLegs(bitmapData);
		drawHands(bitmapData);
	}
	
	private function drawTorso(bitmapData:BitmapData):Void {
		for (i in 1...5) {
			for (j in 5...10) {
				bitmapData.setPixel(i, j, _model.getSkinColor());
			}
		}
	}
	
	private function drawLegs(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 10, _model.getSkinColor());
		bitmapData.setPixel(1, 11, _model.getSkinColor());
		
		bitmapData.setPixel(4, 10, _model.getSkinColor());
		bitmapData.setPixel(4, 11, _model.getSkinColor());	
	}
	
	private function drawHands(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 8, _model.getSkinColor());
		bitmapData.setPixel(5, 8, _model.getSkinColor());
	}
	
	private function drawHead(bitmapData:BitmapData):Void {
		for (i in 1...6) {
			for (j in 2...5) {
				bitmapData.setPixel(i, j, _model.getSkinColor());
			}
		}
	}
	
	
	private function createHairFunctionsMap():Void {
		_hairMapLength = 0;
		_hairStylesMap.set(_hairMapLength++, drawLongFirst);
		_hairStylesMap.set(_hairMapLength++, drawLongSecond);
		_hairStylesMap.set(_hairMapLength++, drawLongThird);
		_hairStylesMap.set(_hairMapLength++, drawMediumBack);
		_hairStylesMap.set(_hairMapLength++, drawMediumFront);
		_hairStylesMap.set(_hairMapLength++, drawMediumBack);
		_hairStylesMap.set(_hairMapLength++, drawMediumFront);
		_hairStylesMap.set(_hairMapLength++, drawShortBackFirst);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontFirst);
		_hairStylesMap.set(_hairMapLength++, drawShortBackFirst);
		_hairStylesMap.set(_hairMapLength++, drawShortBackSecond);
		_hairStylesMap.set(_hairMapLength++, drawShortBackThird);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontFirst);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontSecond);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontThird);
		_hairStylesMap.set(_hairMapLength++, drawShortBackFirst);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontSecond);
		_hairStylesMap.set(_hairMapLength++, drawShortBackThird);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontThird);
		_hairStylesMap.set(_hairMapLength++, drawShortFrontFirst);
		_hairStylesMap.set(_hairMapLength++, drawShortBackSecond);
	}
	
	private function createTopFunctionsMap():Void {
		_topMapLength = 0;
		_topStylesMap.set(_topMapLength++, drawTopFirst);
		_topStylesMap.set(_topMapLength++, drawTopSecond);
		_topStylesMap.set(_topMapLength++, drawTopThird);
		_topStylesMap.set(_topMapLength++, drawTopFourth);
	}
}