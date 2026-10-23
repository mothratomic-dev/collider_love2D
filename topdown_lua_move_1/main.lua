require("player")
require("grid")
require("collision")

-- ------------------------------------------------
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest") -- pixel render
    player.load()
    grid.load()
    collision.load()
end

function love.update(dt)
    player.update(dt)
end

function love.draw()
    love.graphics.scale(2, 2) -- scale x2
    collision.draw()
    grid.draw()
    player.draw()
end

