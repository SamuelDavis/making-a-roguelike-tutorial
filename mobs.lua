function ADD_MOB(type, x, y)
    local mob = {type = type, x = x, y = y, ani = {192, 193, 194, 195}}
    MOBS[#MOBS + 1] = mob
    return mob
end
