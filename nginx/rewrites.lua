local redis = require "resty.redis"
local red = redis:new()
-- see all available redis: methods @ https://github.com/openresty/lua-resty-redis#methods
local ok, err = red:connect("db", 6379)
if not ok then
  ngx.log(ngx.ERR, "failed to connect to redis: ", err)
  return ngx.exit(500)
end
red:set_timeout(1000)
-- used for testing to popuate DB
red:set("/ping", "pong")
red:set("/DOC-1234", "/IT/Awesome")
red:set("/DOC-2351", "/IT/Rules")
local redirect_candidate = ngx.var.request_uri
local rewrite_value, err = red:get(redirect_candidate)
-- modify the next line to suit your needs
if rewrite_value == "pong" then
  ngx.say("PONG")
elseif rewrite_value ~= ngx.null then
  ngx.redirect("http://ubuntu" .. rewrite_value, 301);
else
  ngx.exit(400)
end
