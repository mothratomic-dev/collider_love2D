require("collision")

player = {}

local TILE = 16                                   -- size tile (pixel)

function player.load()
    player.x = 160                                -- player position x
    player.y = 112                                -- player position y
    player.speed = 1                              -- player speed
    player.moving = false                         -- true move
    player.targetX = player.x                     -- target x
    player.targetY = player.y                     -- target y
    player.pause = 0                              -- pause frame
    player.sprite =
    love.graphics.newImage("sprites/player.png")  -- sprite png
end
-- ----------------------------------------------------------

function player.update()

    if player.pause > 0 then
        player.pause = player.pause - 1
        return
    end

    if not player.moving then

        -- c o n t r o l l e r --

        local dx, dy = 0, 0

        if love.keyboard.isDown("up") then          -- up
            dy = -TILE
        elseif love.keyboard.isDown("down") then    -- down
            dy = TILE
        elseif love.keyboard.isDown("left") then    -- left
            dx = -TILE
        elseif love.keyboard.isDown("right") then   -- right
            dx = TILE
   
        end

        if dx ~= 0 or dy ~= 0 then
            -- collision
            local newX = math.max(0, math.min(player.x + dx, 352 - player.sprite:getWidth()))
            local newY = math.max(0, math.min(player.y + dy, 240 - player.sprite:getHeight()))

            if (newX ~= player.x or newY ~= player.y) and not collision.isBlocked(newX, newY) then
                player.targetX = newX
                player.targetY = newY
                player.moving = true
            end
        end

    else

        -- target move
        if player.targetX > player.x then
            player.x = player.x + player.speed
        elseif player.targetX < player.x then
            player.x = player.x - player.speed
        end

        if player.targetY > player.y then
            player.y = player.y + player.speed
        elseif player.targetY < player.y then
            player.y = player.y - player.speed
        end

        -- destination
        if player.x == player.targetX and player.y == player.targetY then
            player.moving = false
            player.pause = 8 -- stop time
        end

    end

end
-- ----------------------------------------------------------

function player.draw()
    love.graphics.draw(player.sprite, player.x, player.y)     -- player sprite
end
