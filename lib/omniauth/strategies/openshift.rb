require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Openshift < OmniAuth::Strategies::OAuth2
      option :name, "openshift"

      option :client_options, {
        site: "https://10.1.2.2:8443/", 
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ 'test' }

    end
  end
end
