package src;

import utils.ColorConverter;
import model.HumanModel;
import model.HumanBaseParameters;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import utils.Utils;
/**
 * ...
 * @author zelek
 */
class HumanFactory
{
	var _model:HumanModel;
	
	public function new() {
		_model = new HumanModel();
	}
	
	public function createRandomHuman():Bitmap {
		createRandomModel();
		
		return new Bitmap(createBitmapDataFromModel(_model));
	}
	
	private function createRandomModel():Void {
		_model.randomize();
	}
	
	private function createBitmapDataFromModel(model:HumanModel):BitmapData {
		var bitmapData:BitmapData = new BitmapData(HumanBaseParameters.WIDTH, HumanBaseParameters.HEIGHT, true, 0);
		
		bitmapData.lock();
		drawBody(bitmapData);
		drawEyes(bitmapData);
		
		drawBottom(bitmapData);
		drawTop(bitmapData);
		
		bitmapData.unlock();
		
		return bitmapData;
	}
	
	private function drawTop(bitmapData:BitmapData) {
		if (!_model.top.isShort()) {
			bitmapData.setPixel(1, 7, _model.top.getClothColor());
		}
		bitmapData.setPixel(1, 5, _model.top.getClothColor());
		bitmapData.setPixel(2, 5, _model.top.getClothColor());
		bitmapData.setPixel(3, 5, _model.top.getClothColor());
		bitmapData.setPixel(4, 5, _model.top.getClothColor());
		
		bitmapData.setPixel(1, 6, _model.top.getClothColor());
		bitmapData.setPixel(2, 6, _model.top.getClothColor());
		bitmapData.setPixel(3, 6, _model.top.getClothColor());
		bitmapData.setPixel(4, 6, _model.top.getClothColor());
		
		bitmapData.setPixel(2, 7, _model.top.getClothColor());
		bitmapData.setPixel(3, 7, _model.top.getClothColor());
		bitmapData.setPixel(4, 7, _model.top.getClothColor());
		
		bitmapData.setPixel(2, 8, _model.top.getClothColor());
		bitmapData.setPixel(3, 8, _model.top.getClothColor());
		bitmapData.setPixel(4, 8, _model.top.getClothColor());
	}
	
	private function drawBottom(bitmapData:BitmapData) {
		drawBoots(bitmapData);
		drawBottomClothes(bitmapData);
	}
	
	private function drawBottomClothes(bitmapData:BitmapData):Void {
		if (!_model.bottom.isShort()) {
			bitmapData.setPixel(1, 10, _model.bottom.getClothColor());
			bitmapData.setPixel(4, 10, _model.bottom.getClothColor());
		}
		
		bitmapData.setPixel(1, 9, _model.bottom.getClothColor());
		bitmapData.setPixel(2, 9, _model.bottom.getClothColor());
		bitmapData.setPixel(3, 9, _model.bottom.getClothColor());
		bitmapData.setPixel(4, 9, _model.bottom.getClothColor());
	}
	
	private function drawBoots(bitmapData:BitmapData):Void {
		bitmapData.setPixel(1, 11, _model.bottom.getBootsColor());
		bitmapData.setPixel(4, 11, _model.bottom.getBootsColor());
	}
	
	private function drawEyes(bitmapData:BitmapData):Void {
		var hsl = utils.ColorConverter.rgb2hsl(utils.ColorConverter.toRGB(bitmapData.getPixel(1, 3)));
		hsl.l *= _model.head.getEyeGlowLightness();
		var darkerColor = utils.ColorConverter.toInt(utils.ColorConverter.hsl2rgb(hsl));
		
		bitmapData.setPixel(2, 3, darkerColor);
		bitmapData.setPixel(4, 3, darkerColor);
		
		bitmapData.setPixel(3, 3, _model.head.getEyeColor());
		bitmapData.setPixel(5, 3, _model.head.getEyeColor());
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
	
}