lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-openshift/version"

Gem::Specification.new do |gem|
  gem.add_dependency "omniauth-oauth2",     "~> 1.4"

  gem.add_development_dependency "bundler", "~> 1.0"

  gem.authors       = ["Chris Pitman"]
  gem.email         = ["cpitman@redhat.com"]
  gem.description   = "An OpenShift OAuth2 strategy for OmniAuth that allows applications to authenticate against OpenShift users"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/cpitman/omniauth-openshift"
  gem.licenses      = %w(MIT)

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-openshift"
  gem.require_paths = %w(lib)
  gem.version       = OmniAuth::Openshift::VERSION
end
