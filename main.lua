-- Load some default values for our rectangle.
function love.load()
    x, y, w, h = 20, 20, 60, 20
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
    w = w + 1
    h = h + 1
end

-- Draw a coloured rectangle.
function love.draw()
    -- In versions prior to 11.0, color component values are (0, 102, 102)
    love.graphics.setColor(0, 0.4, 0.4)
    love.graphics.rectangle("fill", x, y, w, h)
    function love.load(
      animation=newAnimation(love.graphics.newImage("oldHero.png"),16,18,1)
    end
  function love.update(dt)
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end
function love.draw()
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 0, 0, 0, 4)
end
function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
animation.duration = duration or 1
    animation.currentTime = 0
    return animation
  end
