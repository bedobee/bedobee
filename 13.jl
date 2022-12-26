function final!(robot)
    numSud,numWest=tocorner!(robot)
    snake!(robot, (Ost,Nord))
    tocorner!(robot)
    firstplace!(robot,Nord,numSud)
    firstplace!(robot,Ost,numWest)
end

function firstplace!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
    end
end

function tocorner!(robot)
    numvert=0
    numhori=0
    while !isborder(robot,West) || !isborder(robot,Sud)
        if isborder(robot,West)
            move!(robot,Sud)
            numvert+=1
        else
            move!(robot,West)
            numhori+=1
        end
    end
    return numvert, numhori
end

function along!(robot, side)
    a=0
    while try_move!(robot, side) # - в этом логическом выражении порядок аргументов важен!
        if (a%2==0)
            putmarker!(robot)
        end
        a+=1
    end
end

function snake!(robot,(side,side1))
    along!(robot, side)
    while try_move!(robot, side1)
        side = inverse(side)
        along!(robot, side)
    end
end

final!(r)
