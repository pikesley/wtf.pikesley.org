require 'sinatra/base'
require 'haml'
require 'kramdown'
require 'rack-google-analytics'

class PikesleyOrg < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-46327971-1'
  @@locals = { :bootstrap_theme => 'http://bootswatch.com/united/bootstrap.min.css' }

  get '/' do
    haml :readme, :locals => @@locals.merge({ :title => 'sam.pikesley.org' })
  end

  not_found do
    haml :four_o_four, :locals => @@locals.merge({ :title => 'nothing to see here'})
  end

  run! if app_file == $0
end