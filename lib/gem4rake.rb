# frozen_string_literal: true

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
#  If you got permission denied errors, you may need: `echo gem: --user-install > ~/.gemrc`
#
class Gem4Rake < ::Rake::TaskLib
  # Initialize Rake tasks to assist developing Ruby Gems.
  def initialize(version)
    @name = File.basename(Dir.getwd) # Get Gem's name from CWD basename.
    @version = version

    build_task
    install_tasks
    push_task
    clean_tasks
  end

  private

  def build_task
    desc "Build #{@name}-#{@version}.gem"
    task :build do
      sh "gem build #{@name}.gemspec"
    end
  end

  def install_tasks
    desc "Install #{@name}-#{@version}.gem"
    task install: :build do
      sh "gem install #{@name}-#{@version}.gem"
    end

    desc "Uninstall #{@name} gems"
    task :uninstall do
      sh "gem uninstall #{@name}"
    end
  end

  def push_task
    desc "Push #{@name}-#{@version}.gem"
    task push: :build do
      sh "gem push #{@name}-#{@version}.gem"
    end
  end

  def clean_tasks
    desc "Cleanup #{@name} gems"
    task :cleanup do
      sh "gem cleanup #{@name}"
    end

    desc "Delete #{@name}-*.gem"
    task :clean do
      rm Dir.glob("#{@name}-*.gem")
    end
  end
end
