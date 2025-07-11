term.clear()
local x, y = term.getSize()
local midx, midy = x / 2, y / 2
term.setCursorPos(midx - 3, midy)
term.setCursorBlink(false)
term.setTextColor(colors.lightBlue)
io.write("LightOS")
function middle(text, y)
local textl = #text
term.setCursorPos(midx - textl + 7, y)
io.write(text)
end
middle("PowerAnything", midy + 1)
sleep(2)
term.clear()
for n = 0, x do
term.setCursorPos(n, y)
term.setBackgroundColor(colors.gray)
term.write(" ")
end
