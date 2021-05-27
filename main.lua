-- controls
LEFT, RIGHT, UP, DOWN, FIRE1, FIRE2 = 0, 1, 2, 3, 4, 5
DIRECTIONS = {
    [LEFT] = {-1, 0},
    [RIGHT] = {1, 0},
    [UP] = {0, -1},
    [DOWN] = {0, 1}
}
-- colors
BLACK, DARK_BLUE, DARK_PURPLE, DARK_GREEN, BROWN, DARK_GRAY, LIGHT_GRAY, WHITE, RED, ORANGE, YELLOW, GREEN, BLUE, INDIGO, PINK, PEACH =
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

-- tiles
FLOOR, WALL, TABLET, JAR_SMALL, JAR_LARGE, BOX_SMALL_OPEN, BOX_SMALL_CLOSE, BOX_LARGE_OPEN, BOX_LARGE_CLOSE, DOOR, STAIR_UP, STAIR_DOWN =
    1, 2, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

-- flags
IMPASSIBLE, INTERACTIVE = 0, 1

-- display
TILE_SIZE = 8
SCREEN_SIZE = 128
SCREEN_CENTER = SCREEN_SIZE / 2
FONT_WIDTH, FONT_HEIGHT = 4, 5
SPRITE_PLAYER = 240
ANI_SPD = 8

-- variables
INPUT_BUFFER = nil
T = 0
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
end

function _update60()
    T = T + 1
    INPUT_BUFFER = GET_INPUT()
    _UPD()
end

function _draw() _DRW() end
