  local redis = require "resty.redis"
  local red = redis:new()
  -- local dbip = DBIP 
  -- ngx.log(ngx.ERR, "heres the IP: ", dbip)
  -- see all available redis: methods @ https://github.com/openresty/lua-resty-redis#methods
  local ok, err = red:connect("db", 6379)
  if not ok then
    ngx.log(ngx.ERR, "failed to connect to redis: ", err)
    return ngx.exit(500)
  end
  -- red:select(1)
  red:set_timeout(1000)
  red:set("/test", "/testing")
  red:set("/DOC-1234", "/IT/Awesome")
  red:set("/DOC-2351", "/IT/Rules")
  -- red:set_keepalive(0, 100)
  -- ngx.log(ngx.ERR, "URI: ", ngx.var.request_uri)
  local redirect_candidate = ngx.var.request_uri
  -- ngx.say(redirect_candidate)
  local rewrite_value, err = red:get(redirect_candidate)
  ngx.redirect("http://ubuntu" .. rewrite_value, 301);
