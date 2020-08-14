local sti = require "sti"
require "player"

function love.load()
  player = {}
  player.x = 640
  player.y = 100
  player.speed = 0
  player.maxSpeed = 100
  player.acceleration = 90
  player.deceleration = player.acceleration * 0.7
  player.rotate = 0
  player.img = love.graphics.newImage('assets/player.png')
  player.width = player.img:getWidth()
  player.height = player.img:getHeight()

  -- Collision
 -- Set world meter size (in pixels)
 love.physics.setMeter(32)

 -- Load a map exported to Lua from Tiled
 map = sti("assets/tiled/race_01.lua", { "box2d" })

 -- Prepare physics world with horizontal and vertical gravity
 world = love.physics.newWorld(0, 0, true)

 -- Prepare collision objects
 map:box2d_init(world)

 -- Create a Custom Layer
 map:addCustomLayer("Sprite Layer", 8)
end

function love.update(dt)
  playerMovement(dt)
  map:update(dt)
  world:update(dt)
  print(#map.layers)
end

function love.draw()

  -- Draw the map and all objects within
	love.graphics.setColor(1, 1, 1)
	map:draw()

	-- Draw Collision Map (useful for debugging)
	love.graphics.setColor(1, 0, 0)
	map:box2d_draw()

  love.graphics.draw(player.img, player.x, player.y, player.rotate + math.pi/2, 1, 1, player.width/2, player.height/2)
end
