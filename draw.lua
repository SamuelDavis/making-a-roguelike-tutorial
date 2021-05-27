function DRAW_GAME()
    cls()
    map()

    palt(BLACK, false)
    pal(LIGHT_GRAY, YELLOW)
    spr(SPRITE_PLAYER, P_X * 8, P_Y * 8)
    pal()
end
