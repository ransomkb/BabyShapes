Star = class()

function Star:init()
    self.x = WIDTH*3/4
    self.y = HEIGHT/4
    self.size = WIDTH*0.3
    self.rota = 0
    self.shape = "Documents:OutStar6"
    self.myMusic = "Game Music One:Baby F Maj"
    self.codeaMusic = "Game Music One:Funk Blue Cube"
    self.myVoice = "Game Music One:YNiHao"
    self.soundGroup = SOUND_JUMP
    self.soundType = 25363
    self.originalState = {x = self.x, y = self.y, size = self.size, rota = self.rota}
end

function Star:draw()
    pushMatrix()
    translate(self.x, self.y)
    rotate(self.rota)
    sprite(self.shape, 0, 0, self.size)
    popMatrix()
end

function Star:checkImage(i)
    if i == 1 then
        self.shape = "Documents:OutStar6"
    elseif i == 2 then
        self.shape = "Documents:Star6"
    elseif i == 3 then
        self.shape = "Documents:OutStar"
    else
        self.shape = "Documents:BabyStar"
    end
end

function Star:setNoise(val)
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

function Star:reset()
    self.x = self.originalState.x
    self.y = self.originalState.y
    self.size = self.originalState.size
    self.rota = self.originalState.rota
end
