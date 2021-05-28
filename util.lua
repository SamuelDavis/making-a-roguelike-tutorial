function NOOP() end

function GET_FRAME(ani) return ani[flr(time() / ANI_SPD) % #ani + 1] end

function DRAW_SPRITE(sprite, x, y, tint, flip)
    palt(BLACK, false)
    pal(LIGHT_GRAY, tint)
    spr(sprite, x, y, 1, 1, flip)
    pal()
end

function GET_INPUT()
    for i = LEFT, FIRE2 do if btnp(i) then return i end end
    return nil
end
