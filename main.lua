-- controls
LEFT, RIGHT, UP, DOWN, FIRE1, FIRE2 = 0, 1, 2, 3, 4, 5
DIRECTIONS = {
    [LEFT] = {-1, 0},
    [RIGHT] = {1, 0},
    [UP] = {0, -1},
    [DOWN] = {0, 1},
    topleft = {-1, -1},
    bottomleft = {-1, 1},
    topright = {1, -1},
    bottomright = {1, 1}
}
-- colors
BLACK, DARK_BLUE, DARK_PURPLE, DARK_GREEN, BROWN, DARK_GRAY, LIGHT_GRAY, WHITE, RED, ORANGE, YELLOW, GREEN, BLUE, INDIGO, PINK, PEACH =
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

-- tiles
FLOOR, WALL, TABLET, JAR_SMALL, JAR_LARGE, BOX_SMALL_OPEN, BOX_SMALL_CLOSE, BOX_LARGE_OPEN, BOX_LARGE_CLOSE, DOOR, STAIR_UP, STAIR_DOWN =
    1, 2, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

-- flags
IMPASSIBLE, INTERACTIVE = 0, 1

-- sound effects
SFX_JAR, SFX_BOX, SFX_DOOR, SFX_MOVE = 59, 61, 62, 63

-- mob types
SLIME = 0

-- display
TILE_SIZE = 8
SCREEN_SIZE = 128
SCREEN_CENTER = SCREEN_SIZE / 2
FONT_WIDTH, FONT_HEIGHT = 4, 6
SPRITE_PLAYER = 240
ANI_SPD = 8 / 60
WINDOW_COLLAPSE_SPD, WINDOW_PADDING_X, WINDOW_PADDING_Y = 8, 4, 5

-- variables
MOBS = {}
WINDOWS = {}
INPUT_BUFFER = nil
_UPD, _DRW = NOOP, NOOP

function _init()
    _UPD = UPDATE_GAME
    _DRW = DRAW_GAME

    P_X, P_Y = 5, 1
    P_OX, P_OY, P_SOX, P_SOY = 0, 0, 0, 0
    P_T, P_DT = 0, 0.25
    P_ANI = {
        SPRITE_PLAYER, SPRITE_PLAYER + 1, SPRITE_PLAYER + 2, SPRITE_PLAYER + 3
    }
    P_FLIP = false
    P_MOV = NOOP

    ADD_MOB(SLIME, 2, 2)
end

function _update60()
    INPUT_BUFFER = GET_INPUT()
    if WINDOWS.prompt ~= nil then
        if btnp(FIRE2) then WINDOWS.prompt.duration = 0 end
        return
    end
    _UPD()
end

function _draw()
    _DRW()
    DRAW_WINDOWS()
end
