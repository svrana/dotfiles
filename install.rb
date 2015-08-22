#!/usr/bin/env ruby

require 'optparse'
require 'ostruct'


class OptParser {
  def self.parse(args) {
    options = OpenStruct.new
    options.half_baked = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: install.rb [options]"

      opts.on("-h", "--inplace [EXTENSION]",
              "Install for non-primary machine") do |ext|
        options.half_baked = true
      end
  }
}


class DotfileInstaller {
  def self.create_directories(options) {
  }

  def self.create_links(options) {
  }

  def self.update_permissions(options) {
  }

  def self.download_repos(options) {
  }

  def self.install_powerline(options) {
  }

  def self.run(options) {
    create_directories)o
  }
}


{
  options = OptParser.parse(ARGV)
  DotfileInstaller.run(options)
}
