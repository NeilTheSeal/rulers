# frozen_string_literal: true

require_relative "lib/rulers/version"

Gem::Specification.new do |spec|
  spec.name = "rulers"
  spec.version = Rulers::VERSION
  spec.authors = ["NeilTheSeal"]
  spec.email = ["neil.hendren@gmail.com"]

  spec.summary = "A miniature version of Ruby on Rails"
  spec.description = "A miniature version of Ruby on Rails, based on the book 'Rebuilding Rails' by Noah Gibbs."
  spec.homepage = "https://rebuilding-rails.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "http://localhost"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/NeilTheSeal/rulers"
  spec.metadata["changelog_uri"] = "https://github.com/NeilTheSeal/rulers"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.each_line("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rack", "~> 3.1"
  spec.add_dependency "webrick", "~> 1.9.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
