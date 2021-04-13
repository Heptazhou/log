using Dates: Dates

const file = "index.md"

try
	cd("docs")
	isfile(file) || error()
	tfile = file * ".tmp"
	cp(file, tfile, force = true)
	str = read(tfile, String)
	open(tfile, "w") do io
		date8 = Dates.format(Dates.now(Dates.UTC), "yyyymmdd")
		print(io, "\n#\t$date8\n\n\n*****")
		if str != "" && str[1] != '\n'
			print(io, "\n")
		end
		print(io, str)
	end
	mv(tfile, file, force = true)
	@info "完成"
catch e
	@info "错误"
	@info e
end
readline()
