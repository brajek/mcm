#! usr/bin/env ruby 

['twitter', 'facebook', 'mail', 'sms'].each {|mm|
    $:.push(File::dirname(__FILE__) + '/' + mm)
}

require 'rubygems'
require 'my_twitter.rb'
require 'facebook.rb'
require 'mail.rb'
require 'sms.rb'



# --- facebook ---
fb_access_token = "AAADPeF8G3KABALeBPZBZAXtYU3ZAEaMYum85ida8xj2M58dJGPl0V2qNOWuFQ5Vo6VSDW9ZCMZCD5CH4XWS9MWa4vUZAQNtYvqPo173MvhDwZDZD"
fb_username = 'fb_username'

# --- twiiter ---
tw_consumer_key = "0ncxihTMinRvccZHBTNhg"
tw_consumer_secret = "HTkOeUa4kyiJh88ymHSTyL308PdnmLw8XYEEfSkyXM"
tw_oauth_token = "719921940-0V0h1VHCGfAoIPkW3INK8U2DEiPAY0DbmaIp1JHI"
tw_oauth_token_secret = "rPEgRB0E094u4eRq9fkpGonYWwLdXO6D4jO4mhbxXXg"

# --- mobile ---
sms_username = "arsdata"
sms_password = "xml4sms44"
mms_href = "http://upload.wikimedia.org/wikipedia/en/thumb/1/10/Winniethepooh.png/220px-Winniethepooh.png"

# --- mail ---
My_mail.delivery_method =  :smtp
My_mail.perform_deliveries = true
My_mail.raise_delivery_errors = true
My_mail.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'baci.lindsaar.net',
    :user_name            => 'user_name',
    :password             => '123456',
    :authentication       => 'plain',
    :enable_starttls_auto => true  }



class My_user
    
    attr_reader :twitter , :facebook , :mail , :sms 
    attr_reader :short_message , :long_message , :html_message  

    def initialize ( fb_acces_token , fb_username, tw_consumer_key, tw_consumer_secret, tw_oauth_token , tw_oauth_token_secret , sms_username, sms_password)           
        @twitter = My_Twitter.new( tw_consumer_key , tw_consumer_secret, tw_oauth_token, tw_oauth_token_secret )
        @facebook = My_Facebook.new(fb_username , fb_acces_token)
        @mobile =  My_Mobile.new(sms_username, sms_password)
        @mail = My_mail
        @short_message = "This is a short example message to send by twitter"
        @long_message = "This is a long example message to send by facebook and email modules" 
        @html_message = "<p><b> This is a html example message to send by eamil module<b> </p>"
    end      
    
end

user = My_user.new(fb_access_token, fb_username, tw_consumer_key, tw_consumer_secret, tw_oauth_token , tw_oauth_token_secret, sms_username, sms_password )

#user.facebook.get_user
#user.facebook.share_on_wall(user.long_message)

#user.twitter.set_configuration
#user.twitter.send_message(user.short_message)

#user.mail.send_message("piotrek_cypu1@wp.pl","this is text ", "<p>This is html</p>", "Email title").deliver

#user.mobile.send_sms("696243649", user.short_message) 
#user.mobile.send_mms("696243649", "subject", mms_href) 





