function DRAW_GAME()
    cls()
    map()

    DRAW_SPRITE(GET_FRAME(P_ANI), P_X * TILE_SIZE + P_OX,
                P_Y * TILE_SIZE + P_OY, YELLOW, P_FLIP)

    for _, mob in pairs(MOBS) do
        DRAW_SPRITE(GET_FRAME(mob.ani), mob.x * TILE_SIZE, mob.y * TILE_SIZE,
                    ORANGE)
    end
end
