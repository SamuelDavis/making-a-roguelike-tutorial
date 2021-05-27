function DRAW_GAME()
    cls()
    map()

    DRAW_SPRITE(GET_FRAME(P_ANI), P_X * TILE_SIZE + P_OX,
                P_Y * TILE_SIZE + P_OY, YELLOW, P_FLIP)
end
