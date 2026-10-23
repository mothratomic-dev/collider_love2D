collision = {}

local TILE = 16

function collision.load()
    collision.sprite = love.graphics.newImage("sprites/wall.png")
    collision.floorSprite = love.graphics.newImage("sprites/floor.png")
end
-----------------------------------------------------------

-- 1 = wall.png, 0 = floor.png -- 22 colonnes x 15 lines (352/16 x 240/16)
collision.map = {
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
}

function collision.draw()
    for row, rowData in ipairs(collision.map) do
        for col, cell in ipairs(rowData) do
            local x, y = (col - 1) * TILE, (row - 1) * TILE
            if cell == 1 then
                love.graphics.draw(collision.sprite, x, y)
            else
                love.graphics.draw(collision.floorSprite, x, y)
            end
        end
    end
end

-- --------------------------------------------------------
function collision.isBlocked(x, y)
    local col = math.floor(x / TILE) + 1        
    local row = math.floor(y / TILE) + 1

    local rowData = collision.map[row]
    if not rowData then return true end         

    return rowData[col] == 1 
end
