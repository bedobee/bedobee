using HorizonSideRobots
function perimeter!(robot)
    corner!(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
end

function corner!(robot)
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end
