local sheets = gdt.ROM.User.SpriteSheets
local tabbing = 0

local sprites = {}

local data = {
	sprites = sprites,
	AddSheet = function(sheetName:string)
		sprites[sheetName] = {sheet=sheets[sheetName]}
	end,
	AddSprite = function(sheet:string,spriteName:string,topLeft:vec2,size:vec2)
		sprites[sheet][spriteName] = {topLeft,size}
	end,
	DrawSprite = function(vidChip:VideoChip,sheetName:string,sprite:string,pos:vec2,tint:color,bg:color)
		vidChip:DrawCustomSprite(pos,sprites[sheetName]["sheet"],sprites[sheetName][sprite][1],sprites[sheetName][sprite][2],tint,bg)
	end,
	RasterSprite = function(vidChip:VideoChip,sheetName:string,sprite:string,TL:vec2,TR:vec2,BR:vec2,BL:vec2,tint:color,bg:color)
		vidChip:RasterCustomSprite(TL,TR,BR,BL,sprites[sheetName]["sheet"],sprites[sheetName][sprite][1],sprites[sheetName][sprite][2],tint,bg)
	end
}
function data.CreateString(printed)
	printed = printed or sprites
	tabbing += 1
	local out = "{\n"
	for i,v in pairs(printed) do
		if type(v) == "table" then
			out = out..string.rep("	",tabbing)..i.." = "..data.CreateString(v)..",\n"
		elseif type(v) == "string" then
			out = out..string.rep("	",tabbing)..i.." = \""..v.."\",\n"
		elseif type(v) == "vec2" then
			out = out..string.rep("	",tabbing)..i.." = vec2("..tostring(v).."),\n"
		else
			out = out..string.rep("	",tabbing)..i.." = "..tostring(v)..",\n"
		end
	end
	tabbing -= 1
	return out..string.rep("	",tabbing).."}"
end

return data