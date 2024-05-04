-- Get the current sprite
local sprite = app.activeSprite
if not sprite then
    return app.alert("There is no active sprite")
end

-- Define an empty table to store colors
local colors = {}

-- Iterate over each layer in the sprite
for _, layer in ipairs(sprite.layers) do
    -- Check if the layer is visible and editable
    if layer.isVisible and layer.isEditable then
        -- Iterate over each cel in the layer
        for _, cel in ipairs(layer.cels) do
            -- Iterate over each pixel in the cel
            for y = 0, cel.image.height - 1 do
                for x = 0, cel.image.width - 1 do
                    -- Get the color of the pixel at (x, y)
                    local color = cel.image:getPixel(x, y)

                    -- Extract the red, green, and blue components
                    local red = color & 0xFF
                    local green = (color >> 8) & 0xFF
                    local blue = (color >> 16) & 0xFF

                    -- Convert the color to a hexadecimal representation
                    local hexColor = string.format("#%02x%02x%02x", red, green, blue)

                    -- Add the color to the table
                    table.insert(colors, hexColor)
                end
            end
        end
    end
end

-- Print the array of colors
print("Array of colors:")
for i, color in ipairs(colors) do
    print(i, color)
end

-- Return the array of colors (optional)
return colors
