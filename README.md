# Sprite Manager
*A library for Retro Gadgets to allow sprites to be stored as text names for easier use*

Basic use example:
```lua
local spriteManager = require("sprite manager.lua")
local vid = gdt.VideoChip0
local font = gdt.ROM.System.SpriteSheets["StandardFont"]

spriteManager.AddSheet("sheet")
spriteManager.AddSprite("sheet","sprite",vec2(16,16),vec2(16,16))

spriteManager.DrawSprite(vid,"sheet","sprite",vec2(0,0),color.white,color.clear)
spriteManager.RasterSprite(vid,"sheet","sprite",vec2(16,16),vec2(24,16),vec2(32,32),vec2(16,24),color.white,color.clear)
```
