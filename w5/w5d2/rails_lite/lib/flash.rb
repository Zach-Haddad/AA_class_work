require 'json'

class Flash
  def initialize(req)
    cookie = req.cookies['_rails_lite_app']
    @data = cookie ? JSON.parse(cookie) : {}
  end

  def [](key)
    @data[key]
  end

  def []=(key, val)
    @data[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_flash(res)
    cookie = { path: '/', value: @data.to_json }
    res.set_cookie('_rails_lite_app', cookie)
  end
end
