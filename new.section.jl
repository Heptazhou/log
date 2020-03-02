using Dates
using UUIDs: uuid4

file = "index.md"

if isfile(file)
    tfile = file * ".tmp"
    cp(file, tfile, force = true)
    str = read(tfile, String)
    open(tfile, "w") do io
        date8 = Dates.format(now(UTC), "yyyymmdd")
        print(io, "\n#\t$date8\n\n\n*****")
        if str != "" && str[1] != '\n'
            print(io, "\n")
        end
        print(io, str)
    end
    mv(tfile, file, force = true)
    println("完成")
else
    println("错误")
end
readline()
