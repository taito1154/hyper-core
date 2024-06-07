local Card = {}
Card.__index = Card

function Card:init(x, y)
    local self = setmetatable({}, Card)
    self.x = x or 0
    self.y = y or 0
    self.width = 100
    self.height = 150
    return self
end

function Card:draw()
    -- White background color
    local _r, _g, _b, _a = love.graphics.getColor()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 10, 10) -- Rounded corners
    love.graphics.setColor(_r, _g, _b, _a)

    -- Black border
    local _r, _g, _b, _a = love.graphics.getColor()
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 10, 10)
    love.graphics.setColor(_r, _g, _b, _a)
end

return Card