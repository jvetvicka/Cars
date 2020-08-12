
function love.load()
  player = {}
  player.x = 200
  player.y = 200
  player.speed = 0
  player.maxSpeed = 100
  player.acceleration = 90
  player.deceleration = player.acceleration * 0.7
  player.rotate = 0
  player.img = love.graphics.newImage('assets/car-red.png')
  player.width = player.img:getWidth()
  player.height = player.img:getHeight()
end

function love.update(dt)
  local rotAmount = 5 * dt

  if love.keyboard.isDown("right") then
    player.rotate = player.rotate + rotAmount
  elseif love.keyboard.isDown("left") then
    player.rotate = player.rotate - rotAmount
  end

  if love.keyboard.isDown("up") then
    player.speed = player.speed + player.acceleration * dt
  elseif love.keyboard.isDown("down") then
      player.speed = player.speed - player.acceleration * dt
  else
      player.speed = player.speed - player.deceleration * dt
  end

  if player.speed > player.maxSpeed then
      player.speed = player.maxSpeed
  elseif player.speed < 0 then
      player.speed = 0
  end


  player.x = player.x + math.cos(player.rotate) * player.speed * dt
  player.y = player.y + math.sin(player.rotate) * player.speed * dt
end

function love.draw()
  love.graphics.draw(player.img, player.x, player.y, player.rotate, 1, 1, player.width/2, player.height/2)
end
