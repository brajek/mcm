#! usr/bin/env ruby

require 'rubygems'
require 'twitter'

class My_Twitter
    
    def initialize( consumer_key , consumer_secret, oauth_token, oauth_token_secret  )
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @oauth_token = oauth_token
        @oauth_token_secret = oauth_token_secret
    end

    def set_configuration
        Twitter.configure do |config|
          config.consumer_key = @consumer_key
          config.consumer_secret = @consumer_secret
          config.oauth_token = @oauth_token 
          config.oauth_token_secret = @oauth_token_secret 
        end
    end
    
    def send_message(message)
        Twitter.update(message)        
    end    

end
