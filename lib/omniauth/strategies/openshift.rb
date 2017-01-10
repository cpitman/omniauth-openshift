require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Openshift < OmniAuth::Strategies::OAuth2
      option :name, "openshift"

      option :client_options, {
        site: "https://10.1.2.2:8443/", 
      }

      uid{ raw_info['metadata']['uid'] }
      
      info do
        {
          'nickname' => raw_info['metadata']['name']
        }
      end

      def raw_info
        @raw_info ||= begin
          JSON.parse access_token.get("https://10.1.2.2:8443/oapi/v1/users/~").body
        end
      end
      
    end
  end
end
