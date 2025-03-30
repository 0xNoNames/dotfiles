local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

return basename
