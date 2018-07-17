require "sbclient/version"
require 'httparty'

module Sbclient

  class Client

    include HTTParty
    default_options.update(verify: false)
    # debug_output $stdout

    def initialize(company,key)
      @key = key
      @company = company
      self.class.base_uri "https://#{@company}.supportbee.com"
    end

    def tickets(user_options={})
      options={:query=>{}}
      options[:query]=user_options.merge({:auth_token=>"1o3wCM7qZXyQup5nmFSv"})
      options[:headers]={"Content-Type"=> "application/json", "Accept"=> "application/json"}
      response = self.class.get("/tickets", options)
      JSON.parse(response.body)
    end

    def create_tickets(user_options={})
      options={:query=>{}}
      options[:query]=user_options.merge({:auth_token=>"1o3wCM7qZXyQup5nmFSv"})
      options[:headers]={"Content-Type"=> "application/json", "Accept"=> "application/json"}
      response = self.class.post("/tickets", options)
      JSON.parse(response.body)
    end
    
  end
end



#   # Your code goes here...
#   def self.get_tickets(company,options={})
#     api_key = "1o3wCM7qZXyQup5nmFSv"
#     end_point="/tickets"
#     base_url = "https://#{company}.supportbee.com"
#     options['auth_token']="1o3wCM7qZXyQup5nmFSv"
#     begin
#       response = HTTParty.get(base_url+end_point,query:options, headers:{"Content-Type": "application/json", "Accept": "application/json"})  
#       puts response
#     rescue => exception
#       puts exception      
#     end
#   end
# end
