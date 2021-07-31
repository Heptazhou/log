const src = "leap-day.css"
const dst = "leap-day.min.css"

try
	css = read(src, String)
	css = replace(css, r"(?:\n|\t|/\*(?:.|\n)*?\*/|;(?=[\n\s]*\})|(?<=[,:)])\s+|\s+(?=[({]))" => "")
	write(dst, css)
	@info "完成"
catch e
	@info "错误"
	@info e
end
print("> ")
readline()

