const rex = "regex.txt" |> readline |> Regex
const src = "leap-day.css"
const dst = "leap-day.min.css"

try
	css = read(src, String)
	css = replace(css, rex => "")
	write(dst, css)
	@info "完成"
catch e
	@info "错误"
	@info e
end
isempty(ARGS) || exit()
print("> ")
readline()

