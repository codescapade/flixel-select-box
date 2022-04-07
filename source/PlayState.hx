package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	var dragging = false;

	var dragStartX:Int;
	var dragStartY:Int;

	override public function create()
	{
		super.create();

		var testBox = new FlxSprite(100, 100);
		testBox.makeGraphic(20, 20);
		add(testBox);

		sprite = new FlxSprite();
		sprite.makeGraphic(1, 1, 0x668888ff);
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.mouse.pressed && !dragging)
		{
			dragging = true;
			dragStartX = FlxG.mouse.x;
			dragStartY = FlxG.mouse.y;
		}
		else if (FlxG.mouse.justReleased)
		{
			sprite.visible = false;
			dragging = false;
		}

		if (dragging)
		{
			sprite.visible = true;
			var currentX = FlxG.mouse.x;
			var currentY = FlxG.mouse.y;
			var sizeX = Math.abs(currentX - dragStartX);
			var sizeY = Math.abs(currentY - dragStartY);

			sprite.x = dragStartX < currentX ? dragStartX : currentX;
			sprite.y = dragStartY < currentY ? dragStartY : currentY;
			sprite.scale.set(sizeX, sizeY);
			sprite.updateHitbox();
		}
		super.update(elapsed);
	}
}
