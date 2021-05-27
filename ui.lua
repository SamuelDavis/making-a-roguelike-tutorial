function ADD_WINDOW(x, y, w, h, text)
    WINDOWS[#WINDOWS + 1] = {x = x, y = y, w = w, h = h, text = text}
end

function DRAW_WINDOWS()
    for _, window in ipairs(WINDOWS) do
        local x1, y1, x2, y2 = window.x, window.y, window.x + window.w,
                               window.y + window.h

        rectfill(x1, y1, x2, y2, BLACK)
        rect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, WHITE)
        clip(x1 + 3, y1 + 3, window.w - 5, window.h - 5)
        for index, value in ipairs(window.text) do
            print(value, x1 + 3, y1 + 3 + (index - 1) * (FONT_HEIGHT + 1), WHITE)
        end
        clip()
    end
end
