
local backgroundColor
local battleAreaWidthPercent
local sprite
local playerSpriteX
local playerSpriteY
local circle
local time

-- Only works with circles with x, y, and a radius
function checkCollision(a1, a2)
    local distance = ((a1.x - a2.x) ^ 2 + (a1.y - a2.y) ^ 2) ^ 0.5
    return distance < (a1.radius + a2.radius)
end

-- Load some default values for our rectangle.
function love.load()
    time = 0
    backgroundColor = {0.1, 0.1, 0.1, 1}
    battleAreaWidthPercent = 0.4
    playerSprite = love.graphics.newImage("assets/keeny_sprites/blue_body_squircle.png")
    local playerSpriteWidth = playerSprite:getWidth()
    local playerSpriteHeight = playerSprite:getHeight()
    playerSpriteX = 0 - playerSpriteWidth
    playerSpriteY = 0 - playerSpriteHeight

    smallCircle = {
        x = 700,
        y = 300,
        radius = 20,
        shouldDraw = true,
        onCooldown = false,
        timer = 0,
        appearTime = 1,
        cooldownTime = 1.5
    }

    circle = {
        x = 400,
        y = 300,
        radius = 50,
        shouldDraw = false,
        onCooldown = false,
        timer = 0,
        appearTime = 1,
        cooldownTime = 1.5,
        collision = false,
    }
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
    time = time + dt
    -- w = w + 1 
    -- h = h + 1
    if circle.shouldDraw then
        circle.timer = circle.timer + dt

        if circle.timer > circle.appearTime then
            circle.shouldDraw = false
            circle.onCooldown = true
        end
    elseif circle.onCooldown then
        circle.timer = circle.timer + dt

        if circle.onCooldown and circle.timer > (circle.appearTime + circle.cooldownTime) then
            circle.onCooldown = false
        end
    end

    smallCircle.x = 500 + 200 * math.cos(time * 2)
    -- print(math.cos(time))

    circle.collision = circle.shouldDraw and checkCollision(smallCircle, circle)
end

function love.keypressed(key)
    if key == "space" and circle.shouldDraw == false and circle.onCooldown == false then
        circle.shouldDraw = true
        circle.timer = 0
    end
end

-- Draw a coloured rectangle.
function love.draw()
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    
    love.graphics.clear(backgroundColor)
    
    local battleAreaWidth = windowWidth * battleAreaWidthPercent
    local battleAreaX = (windowWidth - battleAreaWidth) / 2
    
    local midPointX  = (windowWidth) / 2
    local midPointY = (windowHeight) / 2

    -- love.graphics.setColor(0.4, 0.4, 0.4)
    -- love.graphics.rectangle("fill", battleAreaX, 0, battleAreaWidth, windowHeight)
    
    -- love.graphics.setColor(0, 0.4, 0.4)
    -- love.graphics.circle("fill", midPointX, midPointY + 150, 100)
    -- love.graphics.draw(playerSprite, midPointX + playerSpriteX, midPointY + playerSpriteY)

    if circle.shouldDraw then
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("fill", circle.x, circle.y, circle.radius)
    end

    if smallCircle.shouldDraw then
        love.graphics.setColor(0, 1, 0)
        love.graphics.circle("fill", smallCircle.x, smallCircle.y, smallCircle.radius)
    end

    if circle.collision then
        love.graphics.print("Circle collided!", 100, 100)
    end
end