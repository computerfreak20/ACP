local file = io.open("TableDump.txt", "w")
file:close()
for k,v in pairs(managers.assets._global.assets) do
	table_print(k)
end