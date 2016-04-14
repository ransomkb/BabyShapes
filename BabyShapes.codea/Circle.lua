Circle = class()

function Circle:init()
    self.x = WIDTH*3/4
    self.y = HEIGHT*3/4
    self.size = WIDTH*0.3
    self.rota = 0
    self.shape = "Documents:OutOval"
    self.myMusic = "Game Music One:Baby C Maj"
    self.codeaMusic = "Game Music One:Happy Song"
    self.myVoice = "Game Music One:YHello"
    self.soundGroup = SOUND_POWERUP
    self.soundType = 13146
    self.originalState = {x = self.x, y = self.y, size = self.size, rota = self.rota}
end

function Circle:draw()
    pushMatrix()
    translate(self.x, self.y)
    rotate(self.rota)
    sprite(self.shape, 0, 0, self.size)
    popMatrix()
end

function Circle:checkImage(i)
    if i == 1 then
        self.shape = "Documents:OutOval"
    elseif i == 2 then
        self.shape = "Documents:Oval"
    elseif i == 3 then
        self.shape = "Documents:OutCircle"
    else
        self.shape = "Documents:BabyCircle"
    end
end

function Circle:setNoise(val)
    if val == 4 then
        sound(self.soundGroup, self.soundType)
    elseif val == 2 then
        music(self.myMusic)
    elseif val == 1 then
        music(self.myVoice)
    elseif val == 3 then
        music(self.codeaMusic)
    end
end

function Circle:reset()
    self.x = self.originalState.x
    self.y = self.originalState.y
    self.size = self.originalState.size
    self.rota = self.originalState.rota
end
