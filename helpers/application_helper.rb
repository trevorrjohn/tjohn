module HTTPAuth
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == credentials
  end

  def credentials
    production? ? [ENV['username'], ENV['password']] : ['admin', 'admin']
  end

  def production?
    Sinatra::Base.production?
  end
end

