function UPDATE_GAME()
    for button, direction in pairs(DIRECTIONS) do
        if btnp(button) then
            local dx, dy = unpack(direction)
            MOVE_PLAYER(dx, dy)
        end
    end
end

function UPDATE_PTURN()
    P_T = min(P_T + P_DT, 1)

    P_MOV()

    if P_T == 1 then _UPD = UPDATE_GAME end
end

function MOV_WALK()
    P_OX = P_SOX * (1 - P_T)
    P_OY = P_SOY * (1 - P_T)
end

function MOV_BUMP()
    local modifier = P_T < 0.5 and P_T or 1 - P_T

    P_OX = P_SOX * modifier
    P_OY = P_SOY * modifier
end
