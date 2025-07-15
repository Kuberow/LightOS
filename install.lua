fs.makeDir("/root/")
fs.makeDir("/root/cmd/")
fs.makeDir("/root/services/")
local x, y = term.getSize()
clear()
local midx, midy = x / 2, y / 2
term.setCursorPos(midx - 3, midy)
term.setCursorBlink(false)
term.setTextColor(colors.lightBlue)
io.write("LightOS")

function middle(text, y)
local textl = #text
term.setCursorPos(midx - textl + 8, y)
io.write(text)
end
middle("Install  LightOS", midy + 1)
sleep(2)
term.clear()
local path = "/root/services/"
local files = fs.list(path)

for i, file in ipairs(files) do
  shell.run(path..file)
end
term.clear()
function kernel()
term.setCursorPos(1,1)
print("LightOS 1.1 Installer")
  print('Write "install" to install.')
shell.run("cd /root/")
while true do
cd = shell.dir()
io.write("["..cd.."] ")
cmd = io.read()
cmdnoarg = cmd:match(cmd:match("^(%S+)"))
if cmdnoarg == "install" then
  shell.run("wget https://raw.github.com/Kuberow/LightOS/main/startup.lua", "/startup.lua")
  shell.run("wget https://raw.github.com/Kuberow/acli/main/acli.lua", "/root/cmd/acli.lua")
  print("Rebooting...")
  sleep(3)
  os.reboot()
  
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
