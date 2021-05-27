LEFT, RIGHT, UP, DOWN, FIRE1, FIRE2 = 0, 1, 2, 3, 4, 5
BLACK, DARK_BLUE, DARK_PURPLE, DARK_GREEN, BROWN, DARK_GRAY, LIGHT_GRAY, WHITE, RED, ORANGE, YELLOW, GREEN, BLUE, INDIGO, PINK, PEACH =
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

SCREEN_SIZE = 128
SCREEN_CENTER = SCREEN_SIZE / 2
FONT_WIDTH, FONT_HEIGHT = 4, 5

local state

function _init() state = {count = 0} end

function _update60() state.count = state.count + 1 end

function _draw()
    cls()

    text = "screen_size = " .. SCREEN_SIZE
    print(text, SCREEN_SIZE - #text * FONT_WIDTH, 0)

    text = "screen_center = " .. SCREEN_CENTER
    print(text, SCREEN_CENTER - #text * FONT_WIDTH / 2,
          SCREEN_CENTER - FONT_HEIGHT / 2)

    text = "font_height, font_width = " .. FONT_HEIGHT .. ", " .. FONT_WIDTH
    print(text, SCREEN_SIZE - #text * FONT_WIDTH, SCREEN_SIZE - FONT_HEIGHT)

    local text = "count: " .. state.count
    print(text, SCREEN_SIZE - #text * FONT_WIDTH,
          SCREEN_SIZE - FONT_HEIGHT * 2 - 1)
end
