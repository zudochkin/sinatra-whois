# index controller
fsd  get '/' do
      haml :index
   end 

  post '/ajax.json' do  
    domain = params[:domain]

    begin
      info = Whois.query(domain)
    rescue Whois::ServerNotFound
    end 
    content_type :json
    
    { :domain => domain, :info => {:available => info.available?, :registered => info.registered?, :expires => info.expires_on} }.to_json unless info.nil?  end

