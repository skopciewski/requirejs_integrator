# RequirejsIntegrator

[![Gem Version](https://badge.fury.io/rb/requirejs_integrator.svg)](http://badge.fury.io/rb/requirejs_integrator)

## Assumptions

* joins the `r.js` and its components into project dependencies
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

## Usage

Add to project's Rakefile:
```
require 'requirejs_integrator'
```

and list the available tasks:
```
rake -T
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
