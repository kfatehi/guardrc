# Guardrc

## Update

I just googled "guardrc" and discovered this functionality exists in Guard at this time (perhaps it even did before I wrote this gem).
Please see https://github.com/guard/guard/issues/265 for more information. Basically you use a .guard.rb file in your home directory.
I won't yank this from rubygems since it has so many downloads and does work.

## Description
Guardrc allows one to have custom Guardfile commands in a different file than the Guardfile. Useful for different developers with different Guardfile preferences to be able to customize without removing/ignoring the Guardfile from git entirely.

## Purpose
I generally commit and do not ignore the Guardfile.
I don't like to see GNTP notifications, but my collaborator does.
The solution? Use another file, call it whatever you want, gitignore it, and load it in the Guardfile

## Usage
Create a file with more Guard::DSL commands somewhere.
I like to create this file in my home folder, calling it `.guardrc`

I usually only do one thing in my .guardrc file:
```ruby
  # ~/.guardrc
  notification :off
```

Add the gem with bundler
```ruby
  # Gemfile
  gem 'guardrc'
```

Run bundle, bundle install, etc to get it installed.

Next, in your Guardfile, require guardrc and eval your external file with Guardrc's help
```ruby
  # Guardfile
  require 'guardrc'
  eval Guardrc.at('~/.guardrc')
```

Now, when you execute `bundle exec guard`, your external file will be read and executed as though its contents were in the Guardfile to begin with.

## Final Notes
Guard is awesome, and I think it should work this way (check and read ~/.guardrc by default); until then you can use this.