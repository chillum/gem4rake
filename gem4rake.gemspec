# frozen_string_literal: true

require_relative 'version'

Gem::Specification.new do |s|
  s.name         = 'gem4rake'
  s.version      = Gem4Rake::VERSION
  s.summary      = 'Rake tasks to assist developing Ruby Gems'
  s.description  = 'Tasks for developing Ruby Gems. Gem and .spec names must match directory basename'
  s.homepage     = 'https://github.com/chillum/gem4rake'
  s.license      = 'Apache-2.0'
  s.author       = 'Vasily Korytov'
  s.email        = 'v.korytov@outlook.com'
  s.metadata     = { 'rubygems_mfa_required' => 'true' }
  s.files        = %w[NOTICE lib/gem4rake.rb]
  s.required_ruby_version = '>= 2.4'
  s.add_dependency 'rake',  '>= 10', '< 14'
end
