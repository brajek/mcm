#! usr/bin/env ruby

require 'rubygems'
require 'action_mailer'

class My_mail < ActionMailer::Base
    default :from =>"szczepanski.peter@gmail.com"
    
    def send_message(recepient , text , html , title)
        mail(:to => recepient, :subject=> title) do |format|
            format.text { render :text => text }
            format.html { render :text => html }
        end
    end

end
