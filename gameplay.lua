function MOVE_PLAYER(dx, dy)
    local tx, ty = P_X + dx, P_Y + dy
    local tile = mget(tx, ty)

    P_FLIP = dx == 0 and P_FLIP or dx < 0

    P_T = 0
    sfx(SFX_MOVE)
    if fget(tile, IMPASSIBLE) then
        P_SOX, P_SOY = dx * TILE_SIZE / 3, dy * TILE_SIZE / 3
        P_OX, P_OY = P_SOX, P_SOY
        P_MOV = MOV_BUMP
        if fget(tile, INTERACTIVE) then TRIGGER_BUMP(tile, tx, ty) end
    else
        P_X, P_Y = P_X + dx, P_Y + dy
        P_SOX, P_SOY = dx * -TILE_SIZE, dy * -TILE_SIZE
        P_OX, P_OY = P_SOX, P_SOY
        P_MOV = MOV_WALK
    end
    _UPD = UPDATE_PTURN
end

function TRIGGER_BUMP(tile, tx, ty)
    if tile == TABLET then
        sfx(SFX_JAR)
        PROMPT({"foo", "bar", "qux", "thud", "grunt"})
    elseif tile == JAR_LARGE or tile == JAR_SMALL then
        sfx(SFX_JAR)
        mset(tx, ty, FLOOR)
        ALERT("disrespect your surroundings!")
    elseif tile == BOX_LARGE_CLOSE then
        sfx(SFX_BOX)
        mset(tx, ty, BOX_LARGE_OPEN)
    elseif tile == BOX_SMALL_CLOSE then
        sfx(SFX_BOX)
        mset(tx, ty, BOX_SMALL_OPEN)
    elseif tile == DOOR then
        sfx(SFX_DOOR)
        mset(tx, ty, FLOOR)
    elseif tile == STAIR_UP then
        -- stair up
    end
end

function PROCESS_INPUT(input)
    if input == nil then return end

    local direction = DIRECTIONS[INPUT_BUFFER]
    if direction ~= nil then MOVE_PLAYER(unpack(direction)) end
end
