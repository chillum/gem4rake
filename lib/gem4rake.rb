require 'rake/tasklib'

#  Rake tasks to assist developing Ruby Gems.
#
#  Gem's name must match current directory's basename.
#
# = Usage:
#
#  Put this in your `Rakefile`:
#
#   require 'gem4rake'
#   Gem4Rake.new $your_app_version
#
# = Example:
#
#  $ rake -T
#  rake build      # Build autoup-1.0.4.gem  
#  rake clean      # Delete autoup-*.gem
#  rake cleanup    # Cleanup autoup gems
#  rake install    # Install autoup-1.0.4.gem
#  rake push       # Push autoup-1.0.4.gem
#  rake uninstall  # Uninstall autoup gems
#
# = Notes:
#
#  We use `sudo` on `install`, `uninstall` and `cleanup` unless:
#   * `SUDO=false` env. variable is set
#   * on Windows
#
class Gem4Rake < ::Rake::TaskLib
  # Initialize Rake tasks to assist developing Ruby Gems.
  def initialize(version)

    @name = File.basename(Dir.getwd) # Get Gem's name from CWD basename.

    desc "Install #{@name}-#{version}.gem"
    task :install => :build do
      sudo "gem install #{@name}-#{version}.gem"
    end

    desc "Uninstall #{@name} gems"
    task :uninstall do
      sudo "gem uninstall #{@name}"
    end

    desc "Cleanup #{@name} gems"
    task :cleanup do
      sudo "gem uninstall #{@name}"
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

  # Run the argument with sudo if on Unix and ENV['SUDO'] != 'false'.
  # Otherwise just run it.
  def sudo(arg)
    if ENV['SUDO'] != 'false' && ! Gem.win_platform?
      sh 'sudo ' + arg
    else
      sh arg
    end
  end

end
