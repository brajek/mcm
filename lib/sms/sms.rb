#! usr/bin/env ruby

require 'net/http'
require 'uri'
require 'digest'

class My_Mobile

    def initialize( username , password)
        @password = Digest::MD5.hexdigest(password)
        @username = username
    end
    
    def send_sms(recepient , sms)
        response = Net::HTTP.post_form(URI.parse('http://api.smsapi.pl/sms.do'),
                               {'username'=> @username, 'password'=> @password , 'to'=> recepient , 'message'=> sms})
        
        code_nr = response.body[6..response.body.length]
        print "Wyslanie wiadomosci nie powiodlo sie - kod bledu #{code_nr} \n" if response.body =~ /ERROR*/      
    end

    def send_mms(recepient , subject, image_address)

        mms = self.create_SMIL_file(image_address)
        response = Net::HTTP.post_form(URI.parse('http://api.smsapi.pl/mms.do'),
                               {'username'=> @username, 'password'=> @password , 'to'=> recepient , 'subject'=> subject , 'smil'=> mms})
        
        code_nr = response.body[6..response.body.length]
        print "Wyslanie wiadomosci nie powiodlo sie - kod bledu #{code_nr} \n" if response.body =~ /ERROR*/      
    end

    def create_SMIL_file(image_address)
        smil = "<smil>
                    <head>
                        <layout> 
                            <region id=\"Image\" width=\"160\" height=\"114\" left=\"0\" top=\"0\" />
                        </layout> 
                    </head>
                    <body>
                        <par> 
                            <img src=\" "+image_address+" \" region=\"Image\" />
                        </par> 
                    </body>
                </smil>"

    end

end

