function ulitka(robot)
    a = true
    side = West
    n_steps = 1
    check_steps = 0
    while a 
        side = right(side)
        for _  in 1:n_steps
            move!(robot,side)
            if ismarker(robot)
                a = false
                return
            end
        end
        check_steps += 1
        if check_steps % 2 == 0
            n_steps += 1
        end
    end
end
right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) - 1 , 4)) 