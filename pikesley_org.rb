require 'sinatra/base'
require 'haml'
require 'kramdown'
require 'rack-google-analytics'


class PikesleyOrg < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-20895204-12'

  @@locals = {
      :bootstrap_theme => 'http://bootswatch.com/united/bootstrap.min.css'
  }

  get '/' do
    haml :readme, :locals => @@locals.merge(
        {
            :title => 'pikesley.org'
        }
    )
  end

  run! if app_file == $0
end