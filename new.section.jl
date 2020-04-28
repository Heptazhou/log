import Dates

file = "index.md"
cd("docs")

if isfile(file)
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
else
    @info "错误"
end
readline()
