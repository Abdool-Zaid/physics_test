local res = {}
local bodies ={}
 res.render_bool = false
 function  res.test()
    print("physics module imported correctly")
 end

 function res.intit()
    world = love.physics.newWorld(0, 9.81 * 64, true) -- (gravity x, gravity y, sleep)
 end

 function res.add_bodies(objects)
    local obj = objects
    for _, shape in ipairs(obj) do
        local body = love.physics.newBody(world, 0, 0, "dynamic")
        
        for i = 1, #shape - 1 do
           local x1, y1 = shape[i].x, shape[i].y
           local x2, y2 = shape[i + 1].x, shape[i + 1].y
     
           local edgeShape = love.physics.newEdgeShape(x1, y1, x2, y2)
           local fixture = love.physics.newFixture(body, edgeShape)
        end
     
        -- Connect the last and first points to close the shape
        local x1, y1 = shape[#shape].x, shape[#shape].y
        local x2, y2 = shape[1].x, shape[1].y
     
        local edgeShape = love.physics.newEdgeShape(x1, y1, x2, y2)
        local fixture = love.physics.newFixture(body, edgeShape)
     end
     table.insert(bodies, { body = body, shape = shape })
 end



function res.render()
    if res.render_bool==true then
        
        for key, physicsObject in ipairs(bodies) do
            local body = physicsObject.body
            print(body)
            local shape = physicsObject.shape
            love.graphics.polygon("line", body:getWorldPoints(unpack(shape)))
        end
    end
end

return res