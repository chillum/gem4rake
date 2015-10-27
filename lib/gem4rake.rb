require 'rake/tasklib'

# Rake tasks to assist developing Ruby Gems.
#
# Gem's name must match current directory's basename.
#
# = Usage:
#
# Put this in your `Rakefile`:
#
#   require 'gem4rake'
#   Gem4Rake.new $your_app_version
#
# = Example:
#
#   $ rake -T
#   rake build      # Build autoup-1.0.4.gem  
#   rake clean      # Delete autoup-*.gem
#   rake cleanup    # Cleanup autoup gems
#   rake install    # Install autoup-1.0.4.gem
#   rake push       # Push autoup-1.0.4.gem
#   rake uninstall  # Uninstall autoup gems
class Gem4Rake < ::Rake::TaskLib
  # Initialize Rake tasks to assist developing Ruby Gems.
  def initialize(version)

    # Get
    @name = File.basename(Dir.getwd)

    desc "Install #{@name}-#{version}.gem"
    task :install => :build do
      # fixme: we don't always want sudo
      sh "sudo gem install #{@name}-#{version}.gem"
    end

    desc "Uninstall #{@name} gems"
    task :uninstall do
      # fixme: we don't always want sudo
      sh "sudo gem uninstall #{@name}"
    end

    desc "Cleanup #{@name} gems"
    task :cleanup do
      # fixme: we don't always want sudo
      sh "sudo gem uninstall #{@name}"
    end

    desc "Push #{@name}-#{version}.gem"
    task :push => :build do
      sh "gem push #{@name}-#{version}.gem"
    end

    desc "Build #{@name}-#{version}.gem"
    task :build do
      sh "gem build #{@name}.gemspec"
    end

    desc "Delete #{@name}-*.gem"
    task :clean do
      rm Dir.glob("#{@name}-*.gem")
    end

  end
end
