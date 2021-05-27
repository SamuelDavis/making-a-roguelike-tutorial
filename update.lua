function UPDATE_GAME()
    if btnp(LEFT) then
        P_X = P_X - 1
    elseif btnp(RIGHT) then
        P_X = P_X + 1
    elseif btnp(UP) then
        P_Y = P_Y - 1
    elseif btnp(DOWN) then
        P_Y = P_Y + 1
    end
end
