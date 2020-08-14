function playerMovement (dt)
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
