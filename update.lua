function UPDATE_GAME()
    for button, direction in pairs(DIRECTIONS) do
        if btnp(button) then
            dx, dy = unpack(direction)
            P_X, P_Y = P_X + dx, P_Y + dy
            P_SOX, P_SOY = dx * -TILE_SIZE, dy * -TILE_SIZE
            P_OX, P_OY = P_SOX, P_SOY
            P_T = 0
            _UPD = UPDATE_PTURN
        end
    end
end

function UPDATE_PTURN()
    P_T = min(P_T + P_DT, 1)
    P_OX = P_SOX * (1 - P_T)
    P_OY = P_SOY * (1 - P_T)
    if P_T == 1 then _UPD = UPDATE_GAME end
end
