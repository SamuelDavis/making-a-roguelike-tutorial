function UPDATE_GAME()
    if btnp(LEFT) then
        P_X, P_OX = P_X - 1, TILE_SIZE
        _UPD = UPDATE_PTURN
    elseif btnp(RIGHT) then
        P_X, P_OX = P_X + 1, -TILE_SIZE
        _UPD = UPDATE_PTURN
    elseif btnp(UP) then
        P_Y, P_OY = P_Y - 1, TILE_SIZE
        _UPD = UPDATE_PTURN
    elseif btnp(DOWN) then
        P_Y, P_OY = P_Y + 1, -TILE_SIZE
        _UPD = UPDATE_PTURN
    end
end

function UPDATE_PTURN()
    if P_OX > 0 then
        P_OX = P_OX - 1
    elseif P_OX < 0 then
        P_OX = P_OX + 1
    elseif P_OY > 0 then
        P_OY = P_OY - 1
    elseif P_OY < 0 then
        P_OY = P_OY + 1
    else
        _UPD = UPDATE_GAME
    end
end
