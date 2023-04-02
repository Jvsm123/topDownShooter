function love.load()
	Sprites = {}

	Sprites.background = love.graphics.newImage('sprites/background.png');
	Sprites.zombie = love.graphics.newImage('sprites/zombie.png');
	Sprites.player = love.graphics.newImage('sprites/player.png');
	Sprites.bullet = love.graphics.newImage('sprites/bullet.png');

	Player = {};
	Player.x = love.graphics.getWidth() / 2;
	Player.y = love.graphics.getHeight() / 2;
	Player.speed = 180;

	TempRotation = 0;
end

function love.update(dt)
	if love.keyboard.isDown("d") then
		Player.x = Player.x + 1 + Player.speed * dt;
	end
	if love.keyboard.isDown("a") then
		Player.x = Player.x - 1 - Player.speed * dt;
	end
	if love.keyboard.isDown("w") then
		Player.y = Player.y - 1 - Player.speed * dt;
	end
	if love.keyboard.isDown("s") then
		Player.y = Player.y + 1 + Player.speed * dt;
	end

	TempRotation = TempRotation + 0.01;
end

function love.draw()
	love.graphics.draw(Sprites.background, 0, 0);

	love.graphics.draw(
		Sprites.player,
		Player.x,
		Player.y,
		PlayerMouseAngle(),
		nil, -- sx(default = 1)
		nil, -- sy(default)
		Sprites.player:getWidth() / 2, --off-set width
		Sprites.player:getHeight() / 2 -- off-set heigth
	);
end

function PlayerMouseAngle()
	return math.atan2( love.mouse.getY() - Player.y, love.mouse.getX() - Player.x );
end
