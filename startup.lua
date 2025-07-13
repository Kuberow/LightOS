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
function kernel()
term.setCursorPos(1,1)
print("LightOS 1.0")
if fs.exists("root") then
if fs.exists("root/cmd") then
else
fs.makeDir("/root/cmd")
shell.run("copy /rom/programs/edit.lua /root/cmd/edit.lua")
shell.run("wget", "https://raw.githubusercontent.com/Kuberow/acli/main/acli.lua", "/root/cmd/acli.lua")
end
else
print("Installing...")
print("Recovering Root...")
sleep(3)
fs.makeDir("root")
fs.makeDir("root/cmd")
print("Rebooting...")
sleep(2)
os.reboot()
end
shell.run("cd /root/")
while true do
cd = shell.dir()
io.write("["..cd.."] ")
cmd = io.read()
cmdnoarg = cmd:match(cmd:match("^(%S+)"))
if fs.exists("/root/cmd/"..cmdnoarg..".lua") then
shell.run("/root/cmd/"..cmd)
else
shell.run("/root/cmd/"..cmd..".lua")
print("Unknown command: "..cmdnoarg)
end
end
end
kernel()
while true do
sleep(0)
local time = os.time()
term.setCursorPos(1,1)
print(time)
end
