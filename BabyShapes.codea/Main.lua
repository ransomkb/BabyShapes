-- ColorKids
displayMode(FULLSCREEN_NO_BUTTONS)
-- displayMode(FULLSCREEN)
function setup()
    babySound = 1
    images = 1
    red = 85
    green = 225
    blue = 230
    fill(85, 224, 229, 255)
    
    started = false
    pastels = true
    hasSound = true
    hasOutlines = true
    
    message = Messages()
    circle = Circle()
    square = Square()
    triangle = Triangle()
    star = Star()
    
    imageControl = "Documents:Star6"
end

function draw()
    background(red, green, blue, 255) 
    
    if not started then
        -- for starting background
        sprite("Documents:Baby Back", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT)
        -- for image control
        sprite(imageControl, 25, HEIGHT - 25, 40)
        -- for sound control
        sprite("Documents:BabyNote", WIDTH - 25, HEIGHT - 25)
        message:draw()
        resetAll()
    elseif started then
        sprite("Documents:BabyResetL", WIDTH - 25, HEIGHT - 25)
    end
    
    drawAll()
end

function drawAll()
    square:draw()
    circle:draw()
    triangle:draw()
    star:draw()
end

function resetAll()
    tween.resetAll()
    square:reset()
    circle:reset()
    triangle:reset()
    star:reset()
end

function touched(touch)
    if touch.state == BEGAN and touch.tapCount == 1 then
        x = touch.x
        y = touch.y
        resetColors()
        setBackground()
    elseif touch.state == ENDED and touch.tapCount == 1 then
        isStarted()
    end
end

function isStarted()
    if y > HEIGHT - 50 and x > WIDTH - 50 then
        music.stop()
        if started then
            started = false
        elseif not started then
            if babySound >= 4 then
                babySound = 1
            else
                babySound = babySound + 1
            end
            message:printSound(babySound)
        end
    elseif y > HEIGHT - 50 and x < 50 then
        if not started then
            if images >= 4 then
                images = 1
            else
                images = images + 1
            end
            setImages()
            setImageControl()
        end
    else
        started = true
    end
end

function resetColors()
    red = 0
    green = 0
    blue = 0
end

function setBackground()
    music.stop()
    if isLeft() then 
        if isTop() then
            if not pastels then
                red = 255
            else
                red = 110
                green = 200
                blue = 255
            end
            square:setNoise(babySound)
            if hasOutlines then
                moveCircle()
            end
        else
            if not pastels then
                green = 255
            else
                red = 240
                green = 155
                blue = 205
            end
            triangle:setNoise(babySound)
            if hasOutlines then
                moveSquare()
            end
        end
    else
        if isTop() then
            if not pastels then
                blue = 255
            else
                red = 185
                green = 180
                blue = 230
            end
            circle:setNoise(babySound)
            if hasOutlines then
                moveStar()
            end
        else
            if not pastels then
                red = 255
                green = 255
            else
                red = 255
                green = 205
                blue = 155
            end
            star:setNoise(babySound)
            if hasOutlines then
                moveTriangle()
            end
        end
    end
end
    
function isLeft()
    if x < WIDTH/2 then 
        return true
    end
    return false
end

function isTop()
    if y > HEIGHT/2 then 
        return true
    end
    return false
end

function setImageControl()
    if images == 1 then
        hasOutlines = true
        pastels = true
        imageControl = "Documents:Star6"
    elseif images == 2 then
        hasOutlines = false
        pastels = true
        imageControl = "Documents:OutStar"
    elseif images == 3 then
        hasOutlines = true
        pastels = false
        imageControl = "Documents:BabyCircle"
    elseif images == 4 then
        hasOutlines = false
        pastels = false
        imageControl = "Documents:OutHeart"
    end
end

function setImages()
    square:checkImage(images)
    circle:checkImage(images)
    triangle:checkImage(images)
    star:checkImage(images)
end

function moveSquare()
    square:reset()
    tween.resetAll()
    local p1 = {x=square.x, y=square.y, rota = 0}
    local p2 = {x=square.x+WIDTH*0.1, y=square.y, rota=90}
    tween.path(1.0, square, {p1,p2,p1}, {loop=tween.loop.forever})
end

function moveCircle()
    circle:reset()
    tween.resetAll()
    local p1 = {x=circle.x, y=circle.y, size=circle.size}
    local p2 = {x=circle.x+WIDTH*0.05, y=circle.y, size=circle.size*0.8}
    local p3 = {x=circle.x, y=circle.y-HEIGHT*0.05, size=circle.size*1.2}
    local p4 = {x=circle.x-WIDTH*0.05, y=circle.y, size=circle.size*0.9}
    tween.path(1.0, circle, {p1,p2,p3,p4,p1}, {loop=tween.loop.forever})
end

function moveTriangle()
    triangle:reset()
    tween.resetAll()
    local p1 = {size = triangle.size}
    local p2 = {size = triangle.size*1.2}
    local p3 = {size = triangle.size*0.8}
    tween.path(1.0, triangle, {p1,p2,p1,p3,p1}, {loop=tween.loop.forever})
end

function moveStar()
    star:reset()
    tween.resetAll()
    tween(1.0, star, {rota = -360}, {loop=tween.loop.forever})
end

