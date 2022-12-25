using HorizonSideRobots
function cross(robot)
    putmarker!(robot)
    for side in(Nord,Sud,Ost,West)
        along_and_gohome(robot,side)
    end
end

function along_and_gohome(robot,side)
    num_steps = 0
    while !isborder(robot,side)
        move!(robot,side)
        putmarker!(robot)
        num_steps += 1
    end
    for i in 1:num_steps
        move!(robot,inverse(side))
    end
end

inverse(side::HorizonSide)::HorizonSide = HorizonSide((Int(side)+2)%4)