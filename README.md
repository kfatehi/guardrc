# Guardrc

## Description
Guardrc allows one to have custom Guardfile commands in a different file than the Guardfile. Useful for different developers with different Guardfile preferences to be able to customize without removing/ignoring the Guardfile from git entirely.

## Purpose
I generally commit and do not ignore the Guardfile.
I don't like to see GNTP notifications, but my collaborator does.
The solution? Use another file, call it whatever you want, gitignore it, and load it in the Guardfile

## Usage
Create the file `.guardrc.rb` in your project (you can name it anything, .guardrc.rb is an example)
Add the gem with bundler
Next, in your Guardfile, require guardrc and eval your external file with Guardrc's help
```ruby
  require 'guardrc'
  eval Guardrc.at('.guardrc.rb')
```