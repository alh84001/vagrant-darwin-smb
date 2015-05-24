# coding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)
require 'vagrant-darwin-smb/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-darwin-smb"
  spec.version       = VagrantDarwinSMB::VERSION
  spec.authors       = ["alh84001"]
  spec.email         = ["alh84001.hr@hotmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Adds SMB synced folder capability to a Darwin guest.}
  spec.homepage      = "https://github.com/alh84001/vagrant-darwin-smb"
  spec.license       = "MIT"
  
  spec.files        = `git ls-files -z`.split("\x0")
  spec.require_path = 'lib'

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end