
local EMPTY = 0
local PLAYER = 1
local SKY = 2
local DIRT = 3
local ROCK = 4
local BOMB = 5
local MOVER = 6
local GW = 9

local Grid = {}
function Grid.new()
    -- CTOR
    local o = {}
    for i=1,10 do
        local tmp = {}
        for j=1,GW do
            tmp[j] = DIRT
        end
        o[i] = tmp
    end
    for i=1,3 do
        for j=1,GW do
            o[i][j] = SKY
        end
    end
    o.player = {
        row = 5, col = 3
    }

    -- methods
    function o:repr()
        local ts = ""
        for i=1,10 do
            for j=1,GW do
                ts = ts .. " " .. self[i][j]
            end
            ts = ts ..  "\n"
        end
        return ts
    end
    function o:set(r,c,v)
        self[r][c] = v
    end
    function o:get(r,c)
        return self[r][c]
    end
    function o:moveup()
        for i=2,10 do
            for j=1,GW do
                self:set(i-1,j,self:get(i,j))
            end
        end
        -- TODO: what fills the bottom row
    end
    
    -- player stuff
    function o:moveplayerleft()
        self.player.col = self.player.col - 1
    end
    function o:moveplayerright()
        self.player.col = self.player.col + 1
    end
    function o:moveplayerdown()
        
    end

    function o:draw()
    end
    function o:update(dt)
    end
    return o
end

local grid = Grid.new()
grid:set(3,5,PLAYER)
print(grid:repr())