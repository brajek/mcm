#! usr/bin/env ruby

require 'rubygems'
require 'fb_graph'

class My_Facebook

    def initialize (  username ,access_token )
        @access_token = access_token
        @username = username
    end

    def get_user
        @user = FbGraph::User.new(@username , :access_token => @access_token)
    end

    def share_on_wall( message )
        @user.feed!( :message => message , )
    end


end



