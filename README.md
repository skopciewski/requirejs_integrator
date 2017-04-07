# RequirejsIntegrator

[![Gem Version](https://badge.fury.io/rb/requirejs_integrator.svg)](http://badge.fury.io/rb/requirejs_integrator)
[![Code Climate](https://codeclimate.com/github/skopciewski/requirejs_integrator/badges/gpa.svg)](https://codeclimate.com/github/skopciewski/requirejs_integrator)
[![Dependency Status](https://gemnasium.com/badges/github.com/skopciewski/requirejs_integrator.svg)](https://gemnasium.com/github.com/skopciewski/requirejs_integrator)

## Assumptions

* joins the [r.js][rjs] and its components into project dependencies
* provides the tasks for the assets management
* provides the default r.js config

## Requirements

* node.js installed in the system (`node` in the `$PATH`)

## Installation

Add this line to your application's Gemfile:

    gem 'requirejs_integrator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install requirejs_integrator

## Configuration

Through `RequirejsIntegrator::Config` class:

```ruby
config = RequirejsIntegrator::Config.new(
  "project_javascripts_dir" => "js_dir"     # default: "javascripts"
  "project_js_compressed_dir" => "jsc_dir"  # default: "js"
  "project_ui_dir" => "ui_dir"              # default: "."
  "project_public_dir" => "pub_dir"         # default: "public"
  "project_config_dir" => "conf"            # default: "config"
  "project_requirejs_config_file" => "b.js" # default: "build.js"
)
```

## Usage

Add to project's Rakefile:
```ruby
require 'requirejs_integrator'
RequirejsIntegrator::Tasks.load(RequirejsIntegrator::Config.new)
```

and list available tasks:
```ruby
bundle exec rake -T
# rake ri:compile  # Compile js
# rake ri:config   # Install default r.js config
```


## Versioning

See [semver.org][semver]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[semver]: http://semver.org/
[rjs]: http://requirejs.org/
