urls = {}

urls["/"] = dofile("views/vomote.lua")
urls["/pull/"] = dofile("views/pull.lua")
urls["/push/"] = dofile("views/push.lua")


local css = {
    "bootstrap.min.css",
    "bootstrap-responsive.css",
    "darkstrap.css",
    "jquery-ui-1.10.0.custom.min.css",
    "style.css",
}

local js = {
    "jquery-1.9.1.min.js",
    "underscore.min.js",
    "bootstrap.min.js",
    "jquery.strings.js",
    "jquery.jsonrpc.js",
    "jquery.inputHistory.min.js",
    "jquery-ui-1.10.0.custom.min.js",
    "vomote.js",
}


for _, f in ipairs(js) do
    urls["/media/js/"..f] = vomote.http.dispatch.StaticFile:new("media/js/"..f..".lua")
end
for _, f in ipairs(css) do
    urls["/media/css/"..f] = vomote.http.dispatch.StaticFile:new("media/css/"..f..".lua")
end



return urls
