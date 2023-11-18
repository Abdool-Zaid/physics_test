local coor = {}
Loca obj_table = {}
Trail = require("draw")
Phys = require("main.physics")
function love.load()

end

function love.update(dt)
    coor.x, coor.y = love.mouse.getPosition()
        
        Trail.build_char(coor.x,coor.y)
         Trail.clear()


end


function love.mousereleased(x,y,button)
    if button == 1 then
        Trail.Mouse_released()
    
    end
end


function love.draw()
    
    Trail.trace()
  

end