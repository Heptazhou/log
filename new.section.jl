using Dates: Dates, UTC

const file = "index.md"

try
	cd("docs")
	isfile(file) || error()
	tfile = file * ".tmp"
	cp(file, tfile, force = true)
	str = read(tfile, String)
	isempty(str) || str[1] == '\n' || (str = '\n' * str)
	date8 = Dates.format(Dates.now(UTC), "yyyymmdd")
	open(tfile, "w") do io
		print(io, "\n#\t$date8\n\n\n*****")
		print(io, str)
	end
	mv(tfile, file, force = true)
	@info "完成 > $date8"
catch e
	@info "错误"
	@info e
end
isempty(ARGS) || exit()
print("> ")
readline()

