require 'rake/tasklib'

#  Rake tasks to assist developing Ruby Gems.
#
#  Gem's name must match current directory's basename.
#  A `.spec` file with that name is also required.
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
#  On Windows we don't use `--user-install` for install and uninstall.
#  On other platforms we do.
#
class Gem4Rake < ::Rake::TaskLib
  # Initialize Rake tasks to assist developing Ruby Gems.
  def initialize(version)
    @name = File.basename(Dir.getwd) # Get Gem's name from CWD basename.

    desc "Install #{@name}-#{version}.gem"
    task :install => :build do
      user_install "gem install #{@name}-#{version}.gem"
    end

    desc "Uninstall #{@name} gems"
    task :uninstall do
      user_install "gem uninstall #{@name}"
    end

    desc "Cleanup #{@name} gems"
    task :cleanup do
      sh "gem cleanup #{@name}"
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

  # Run the argument with `--user-install` if not on Windows.
  # Otherwise just run it.
  def user_install(arg)
    if Gem.win_platform?
      sh arg
    else
      sh arg + ' --user-install'
    end
  end

end
