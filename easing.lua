local Easing = {}

function Easing.linear(time, start, target, duration)
    return target * time / duration + start
end

function Easing.inOutQuad(time, start, target, duration)
    local halfDuration = duration / 2
    local progress = time / halfDuration
    
    if progress < 1 then 
        return target / 2 * progress * progress + start
    else 
        local adjustedProgress = -1 + progress
        return -target / 2 * (adjustedProgress * (adjustedProgress - 2) - 1) + start
    end
end

function Easing.inOutCubic(time, start, target, duration)
    local t = time / (duration / 2)
    if t < 1 then return target / 2 * t * t * t + start end
    t = t - 2
    return target / 2 * (t * t * t + 2) + start
end

return Easing