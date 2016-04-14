Messages = class()

function Messages:init()
    self.message = "Recommended: turn off Multitasking Gestures in Settings app"
    self.soundMessage = "Play Voices"
end

function Messages:setMessage(m)
    self.soundMessage = m
end

function Messages:printSound(val)
    if val == 4 then
        self:setMessage("Play Sounds")
    elseif val == 2 then
        self:setMessage("Play Chords")
    elseif val == 1 then
        self:setMessage("Play Voices")
    elseif val == 3 then
        self:setMessage("Play Music")
    end
end


function Messages:draw()
    pushStyle()
    
    fill(255, 77, 0, 255)
    text(self.message, WIDTH/2, HEIGHT - 25)
    
    fill(230, 0, 255, 255)
    text(self.soundMessage, WIDTH/2, HEIGHT - 100)
    
    popStyle()
end

