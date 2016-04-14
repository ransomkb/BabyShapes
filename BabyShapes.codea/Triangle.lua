Triangle = class()

function Triangle:init()
    self.x = WIDTH/4
    self.y = HEIGHT/4
    self.size = WIDTH*0.3
    self.rota = 0
    self.shape = "Documents:OutHeart"
    self.myMusic = "Game Music One:Baby B Maj"
    self.codeaMusic = "Game Music One:Pulsar"
    self.myVoice = "Game Music One:EHola"
    self.soundGroup = SOUND_POWERUP
    self.soundType = 34875
    self.originalState = {x = self.x, y = self.y, size = self.size, rota = self.rota}
end

function Triangle:draw()
    pushMatrix()
    translate(self.x, self.y)
    rotate(self.rota)
    sprite(self.shape, 0, 0, self.size)
    popMatrix()
end

function Triangle:checkImage(i)
    if i == 1 then
        self.shape = "Documents:OutHeart"
    elseif i == 2 then
        self.shape = "Documents:Heart"
    elseif i == 3 then
        self.shape = "Documents:OutTriangle"
    else
        self.shape = "Documents:BabyTriangle"
    end
end

function Triangle:setNoise(val)
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

function Triangle:reset()
    self.x = self.originalState.x
    self.y = self.originalState.y
    self.size = self.originalState.size
    self.rota = self.originalState.rota
end
