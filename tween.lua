local function tween(time, start, target, duration, easingFunction)
    return easingFunction(time, start, target, duration)
end

return tween