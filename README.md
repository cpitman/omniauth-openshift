# omniauth-openshift
This is an Omniauth stategy for authenticating users against OpenShift, useful when writing applications for users of OpenShift (as opposed to users of apps deployed on OpenShift). For example, custom self-service monitoring, provisioning or similar capabilities.

## Installing

```
gem install omniauth-openshift
```

## Example Configuration

To configure this provider you will need a couple things:

1. A list of scopes needed for OCP access
2. The public master url (`site` below)
3. The url for the deployed app with the full path that OpenShift should redirect the user to (`redirect_uri` below)
4. A client id and secret that are registered with OpenShift as an OAuthClient. An example is included below.

```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openshift, {
    scope: ['user:full', 'user:info'],
    response_type: :code,
    client_id: 'example-client',
    client_secret: 'super-secret',
    client_options: {
      redirect_uri: 'http://myapp.paas.example.com/auth/openshift/callback',
      site: 'https://master.example.com:8443/'
    }
  }
end
```

### OAuthClient Example

The following yaml can be used to register an oauth client with OpenShift.

```
apiVersion: v1
grantMethod: auto
kind: OAuthClient
metadata:
  name: example-client
redirectURIs:
- http://myapp.paas.example.com/auth/openshift/callback
secret: super-secret
```

Note that the `name` in the OAuthClient is the `client_id` for OmniAuth, and the `secret` is the `client_secret`. Additionally, redirect URIs must be identical.
