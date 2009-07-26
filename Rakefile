require 'rubygems'
require 'rake/gempackagetask'

PLUGIN = "merb_rdb4o"
NAME = "merb_rdb4o"
VERSION = "0.1.0"
AUTHOR = "Kacper Cieśla, Tymon Tobolski"
EMAIL = "kacper.ciesla@gmail.com"
HOMEPAGE = "http://github.com/teamon/merb_rdb4o/"
SUMMARY = "Merb plugin that provides access to db4o database (via rdb4o)."

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = VERSION
  s.platform = 'jruby'
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-core', '>= 1.0')
  s.require_path = 'lib'
  s.autorequire = PLUGIN
  s.files = %w(LICENSE README.markdown Rakefile TODO Generators) + Dir.glob("{lib,specs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

namespace :jruby do

  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{jruby -S gem install pkg/#{NAME}-#{VERSION}-java.gem --no-rdoc --no-ri}
  end  

end
