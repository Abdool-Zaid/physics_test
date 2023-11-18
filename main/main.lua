local coor = {}
local obj_table = {}
local util = require("util")
Trail = require("draw")
Phys = require("main.physics")
function love.load()
Phys.intit()
end

function love.update(dt)
    coor.x, coor.y = love.mouse.getPosition()
        
        Trail.build_char(coor.x,coor.y)
         Trail.clear()


end


function love.mousereleased(x,y,button)
    if button == 1 then
        Trail.Mouse_released()
        obj_table= Trail.objects()
        Phys.add_bodies(obj_table)
        elseif button== 2 then
            Phys.render_bool=true
    end
end


function love.draw()
    
    Trail.trace()
    Phys.render()

end