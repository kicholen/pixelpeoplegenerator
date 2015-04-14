package;

import haxe.ds.Vector;
import openfl.display.Bitmap;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.PNGEncoderOptions;
import openfl.display.SimpleButton;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.utils.ByteArray;
import src.HumanFactory;
import openfl.Lib;
import openfl.events.TouchEvent;
import openfl.Assets;
import openfl.text.TextField;
import sys.io.File;
import sys.io.FileOutput;

/**
 * ...
 * @author zelek
 */

class Main extends Sprite 
{
	private var _humanFactory:HumanFactory;
	private var _humanBitmaps:Vector<Bitmap>;
	private var _zoomedHumanBitmaps:Vector<Bitmap>;
	
	private var _savedBitmaps:Array<Bitmap>;
	
	public static var HUMAN_PER_VIEW:Int = 33;
	
	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	private function onAddedToStage(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		init();
	}
	
	private function init():Void {
		_humanFactory = new HumanFactory();
		_zoomedHumanBitmaps = new Vector<Bitmap>(HUMAN_PER_VIEW);
		_humanBitmaps = new Vector<Bitmap>(HUMAN_PER_VIEW);
		_savedBitmaps = new Array<Bitmap>();
		
		var createHumansButton:SimpleButton = createButton("create");
		createHumansButton.addEventListener(TouchEvent.TOUCH_TAP, onCreateHumansTapped);
		createHumansButton.addEventListener(MouseEvent.CLICK, onCreateHumansTapped);
		addChild(createHumansButton);
		
		var saveButton:SimpleButton = createButton("save");
		saveButton.addEventListener(TouchEvent.TOUCH_TAP, onSaveTapped);
		saveButton.addEventListener(MouseEvent.CLICK, onSaveTapped);
		saveButton.x = createHumansButton.width + createHumansButton.x + 10;
		addChild(saveButton);
		
		var crazyModeButton:SimpleButton = createButton("crazy");
		crazyModeButton.addEventListener(TouchEvent.TOUCH_TAP, onCrazyTapped);
		crazyModeButton.addEventListener(MouseEvent.CLICK, onCrazyTapped);
		crazyModeButton.x = saveButton.width + saveButton.x + 10;
		addChild(crazyModeButton);
	}
	
	private function createButton(name:String):SimpleButton {
		var container:DisplayObjectContainer = new DisplayObjectContainer();
		container.addChild(new Bitmap(Assets.getBitmapData("img/button_blue.png")));
		var format:TextFormat = new TextFormat(Assets.getFont("img/Raleway-Bold.ttf").fontName, 60);
		var textfield:TextField = new TextField();
		textfield.defaultTextFormat = format;
		textfield.selectable = false;
		textfield.text = name;
		container.addChild(textfield);
		
		var button:SimpleButton = new SimpleButton(container, container, container);
		var scale = stage.stageWidth * 10 / 100 / button.width;
		button.scaleX = scale;
		button.scaleY = scale;
		
		return button;
	}
	
	private function onSaveTapped(e:Event):Void {
		var output:String = "out_";
		var suffix:String = ".png";
		for (i in 0..._savedBitmaps.length) {
			var bitmap:Bitmap = _savedBitmaps.pop();
			var byteArray:ByteArray = new ByteArray();
			byteArray = bitmap.bitmapData.encode(bitmap.bitmapData.rect, new PNGEncoderOptions());
			var file:FileOutput = File.write(output + Std.string(i) + suffix, true);
			file.writeString(byteArray.toString());
			file.close();
			bitmap.bitmapData.dispose();
		}
	}
	
	private function onCreateHumansTapped(e:Event):Void {
		createHumans();
	}
	
	private function onCrazyTapped(e:Event):Void {
		_humanFactory.changeMode();
	}
	
	private function onSpriteTapped(e:Event):Void {
		_savedBitmaps.push(new Bitmap(e.target.getChildAt(0).bitmapData.clone()));
	}
	
	private function createHumans() {
		for (i in 0...HUMAN_PER_VIEW) {
			if (_humanBitmaps.get(i) != null) {
				_humanBitmaps.get(i).bitmapData.dispose();
				removeChild(_humanBitmaps.get(i));
				_humanBitmaps.get(i).bitmapData.dispose();
				removeChild(_humanBitmaps.get(i));
			}
			_humanBitmaps.set(i, _humanFactory.createRandomHuman());
			_zoomedHumanBitmaps.set(i, new Bitmap(_humanBitmaps.get(i).bitmapData));
		}
		displayHumans();
	}
	
	public function displayHumans():Void {
		var offset = 10;
		var currentY = 10 / 100 * stage.stageHeight;
		var currentX = 10 / 100 * stage.stageWidth;
		var bitmapWidth:Float = 0.0;
		var bitmapHeight:Float = 0.0;
		
		for (i in 0..._humanBitmaps.length) {
			var bitmap = _humanBitmaps.get(i);
			bitmap.x = currentX;
			bitmap.y = currentY;
			addChild(bitmap);
			if (currentX + bitmap.width * 2 + offset > stage.stageWidth) {
				currentY += bitmap.height + offset;
				currentX = 10 / 100 * stage.stageWidth;
			}
			else {
				currentX += bitmap.width + offset;
			}
			bitmapWidth = bitmap.width;
			bitmapHeight = bitmap.height;
		}
		
		currentY += bitmapHeight + offset;
		currentX = 10 / 100 * stage.stageWidth;
		var zoomScale = (80 / 100 * stage.stageWidth - 10 * offset) / 10 / bitmapWidth;
		
		for (i in 0..._zoomedHumanBitmaps.length) {
			var bitmap = _zoomedHumanBitmaps.get(i);
			bitmap.x = currentX;
			bitmap.y = currentY;
			bitmap.scaleX = zoomScale;
			bitmap.scaleY = zoomScale;
			var sprite = new Sprite();
			sprite.addChild(bitmap);
			addChild(sprite);
			sprite.addEventListener(TouchEvent.TOUCH_TAP, onSpriteTapped);
			sprite.addEventListener(MouseEvent.CLICK, onSpriteTapped);
			if (currentX + bitmap.width * 2 + offset > stage.stageWidth) {
				currentY += bitmap.height + offset;
				currentX = 10 / 100 * stage.stageWidth;
			}
			else {
				currentX += bitmap.width + offset;
			}
		}
	}
	
	public static function main() {
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		Lib.current.stage.color = 0xffffff;
		Lib.current.addChild(new Main());
	}
}
