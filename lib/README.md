## Rake tasks to assist developing Ruby Gems [![Gem Version](https://badge.fury.io/rb/gem4rake.svg)](http://badge.fury.io/rb/gem4rake)

Gem's name must match current directory's basename.

### Installation

`gem install gem4rake`

### Usage

Put this in your `Rakefile`:

```ruby
require 'gem4rake'
Gem4Rake.new $your_app_version
```

### Example

```sh
$ rake -T
rake build      # Build autoup-1.0.4.gem  
rake clean      # Delete autoup-*.gem
rake cleanup    # Cleanup autoup gems
rake install    # Install autoup-1.0.4.gem
rake push       # Push autoup-1.0.4.gem
rake uninstall  # Uninstall autoup gems
```
