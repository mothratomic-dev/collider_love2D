grid = {}

local cellSize = 16 

function grid.load()
    grid.lines = {}
    local windowWidth = 352
    local windowHeight = 240 

    -- lines x
    for x = cellSize, windowWidth, cellSize do
        table.insert(grid.lines, {x, 0, x, windowHeight})
    end

    -- lines y
    for y = cellSize, windowHeight, cellSize do
        table.insert(grid.lines, {0, y, windowWidth, y})
    end
end
------------------------------------------------------------

function grid.draw()
    love.graphics.setLineWidth(0.5)
    love.graphics.setColor(1, 1, 1, 0.5)        -- color

    for i, line in ipairs(grid.lines) do
        love.graphics.line(line)
    end
    love.graphics.setColor(1, 1, 1, 1)          -- stop color
end
