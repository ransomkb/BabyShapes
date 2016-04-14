Square = class()

function Square:init()
    self.x = WIDTH/4
    self.y = HEIGHT*3/4
    self.size = WIDTH*0.3
    self.rota = 0
    self.shape = "Documents:OutDiamond"
    self.myMusic = "Game Music One:Baby G Maj"
    self.codeaMusic = "Game Music One:Sci Fi Workshop"
    self.myVoice = "Game Music One:EKonnichiwa"
    self.soundGroup = SOUND_SHOOT
    self.soundType = 1149
    self.originalState = {x = self.x, y = self.y, size = self.size, rota = self.rota}
end

function Square:draw()
    pushMatrix()
    translate(self.x, self.y)
    rotate(self.rota)
    sprite(self.shape, 0, 0, self.size)
    popMatrix()
end

function Square:checkImage(i)
    if i == 1 then
        self.shape = "Documents:OutDiamond"
    elseif i == 2 then
        self.shape = "Documents:Diamond"
    elseif i == 3 then
        self.shape = "Documents:OutSquare"
    else
        self.shape = "Documents:BabySquare"
    end
end

function Square:setNoise(val)
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

function Square:reset()
    self.x = self.originalState.x
    self.y = self.originalState.y
    self.size = self.originalState.size
    self.rota = self.originalState.rota
end
