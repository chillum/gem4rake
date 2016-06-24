require_relative 'version.rb'

Gem::Specification.new do |s|
  s.name         = 'gem4rake'
  s.version      = Gem4Rake::Version
  s.summary      = 'Rake tasks to assist developing Ruby Gems'
  s.description  = 'Tasks for developing Ruby Gems. Gem and .spec names must match directory basename'
  s.homepage     = 'https://github.com/chillum/gem4rake'
  s.license      = 'Apache-2.0'
  s.author       = 'Vasily Korytov'
  s.email        = 'vasily.korytov@icloud.com'
  s.files        = %w(NOTICE lib/gem4rake.rb)
  s.required_ruby_version   = '>= 1.9.2'
  s.add_dependency 'rake',    '~> 10.0'
end
