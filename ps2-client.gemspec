require_relative 'lib/ps2/client/version'

Gem::Specification.new do |spec|
  spec.name          = "ps2-client"
  spec.version       = Ps2::Client::VERSION
  spec.authors       = ["Telyn Z."]
  spec.email         = ["175827+telyn@users.noreply.github.com"]

  spec.summary       = "Re-implementation of ps2client in ruby"
  spec.description   = "Connect to ps2link and run programs"
  spec.homepage      = "https://github.com/telyn/ps2-client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/telyn/ps2-client"
  spec.metadata["changelog_uri"] = "https://github.com/telyn/ps2-client/raw/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
