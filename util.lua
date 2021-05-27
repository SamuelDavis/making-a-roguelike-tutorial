function NOOP() end

function GET_FRAME(ani) return ani[flr(T / ANI_SPD) % #ani + 1] end

function DRAW_SPRITE(sprite, x, y, tint)
    palt(BLACK, false)
    pal(LIGHT_GRAY, tint)
    spr(sprite, x, y)
    pal()
end
