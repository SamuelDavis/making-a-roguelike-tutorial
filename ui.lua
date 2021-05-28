function ADD_WINDOW(x, y, w, h, text, prompt)
    local window = {x = x, y = y, w = w, h = h, text = text}
    local key = prompt == nil and #WINDOWS + 1 or "prompt"
    WINDOWS[key] = window
    return window
end

function DRAW_WINDOWS()
    for key, window in pairs(WINDOWS) do
        local x1, y1, x2, y2 = window.x, window.y,
                               window.x + window.w + WINDOW_PADDING_X,
                               window.y + window.h + WINDOW_PADDING_Y

        rectfill(x1, y1, x2, y2, BLACK)
        rect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, WHITE)

        clip(x1 + 3, y1 + 3, window.w, window.h)
        for index, value in ipairs(window.text) do
            print(value, x1 + 3, y1 + 3 + (index - 1) * FONT_HEIGHT, WHITE)
        end
        clip()

        if window.duration ~= nil then
            window.duration = window.duration - 1
            if window.duration <= 0 then
                local diff = window.h / WINDOW_COLLAPSE_SPD
                window.y = window.y + diff
                window.h = window.h - diff * 2
                if window.h < 1 then WINDOWS[key] = nil end
            end
        end
    end

    if WINDOWS.prompt ~= nil then
        local x, y = WINDOWS.prompt.x + WINDOWS.prompt.w - FONT_WIDTH * 1.5,
                     WINDOWS.prompt.y + WINDOWS.prompt.h + FONT_HEIGHT / 2 +
            --  prevent twitch
                         min(0, flr(sin(time())))
        PRINT_OUTLINED("❎", x, y)
    end
end

function ALERT(text, duration)
    duration = duration or #text * FONT_WIDTH
    text = " " .. text .. " "
    local y = 0
    for _, other in pairs(WINDOWS) do
        if other.alert == true and other.y >= y then
            y = other.y + other.h + WINDOW_PADDING_Y
        end
    end
    local window = ADD_WINDOW(0, y, #text * FONT_WIDTH, FONT_HEIGHT, {text})
    window.duration = duration
    window.alert = true
end

function PROMPT(text)
    local width = 0
    for _, line in pairs(text) do if width < #line then width = #line end end
    WINDOW = ADD_WINDOW(0, 0, width * FONT_WIDTH, #text * FONT_HEIGHT, text,
                        true)
end

function PRINT_OUTLINED(text, x, y, fg, bg)
    fg, bg = fg or WHITE, bg or BLACK

    for _, direction in pairs(DIRECTIONS) do
        print(text, x + direction[1], y + direction[2], bg)
    end
    print(text, x, y, fg)
end
