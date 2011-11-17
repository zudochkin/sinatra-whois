require 'rubygems'
require 'sinatra'
require 'haml'

require 'whois'
require 'json'

class App < Sinatra::Application
   get '/' do
      haml :index
   end

  post '/ajax.json' do 
    domain = params[:domain]

    begin
      info = Whois.query(domain)
    rescue Whois::ServerNotFound
      print 'fuck'
    end
    content_type :json
    
    { :domain => domain, :info => {:available => info.available?, :registered => info.registered?, :expires => info.expires_on} }.to_json unless info.nil?
    #haml :index
  end
  get '/about' do
    @title = 'Just a simple title'
    haml :about
  end

  get '/whois' do
    r = Whois.query("google.com")

    puts r.available?
    "Hello world, it's #{Time.now} at the server! #{r.available?}"
  end

  get '/sinatra' do 
        "sinatra"
  end
end


