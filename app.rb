load '_init.rb'
require 'whois'
require 'json'

fsdf
dclass App < Sinatra::Application
# load controllers
Dir["#{File.dirname(__FILE__)}/app/controllers/*.rb"].each {|controller| require controller }

end
