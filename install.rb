#!/usr/bin/env ruby

require 'optparse'
require 'ostruct'


class OptParser
  def self.parse(args)
    options = OpenStruct.new
    options.half_baked = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: install.rb [options]"

      opts.on("-h", "Install for non-primary machine") do |ext|
        options.half_baked = true
      end
    end

    opt_parser.parse!(args)
    return options
  end
end

class CmdRunner
  def self.run(*cmds)
    cmds.each do |cmd|
      ret = system("#{cmd}")
      if !ret
        print "Failed: #{cmd}"
        exit(1)
      end
    end
  end
end

class DotfileInstaller
  def self.create_directories(options)
  end

  def self.create_links(options)
  end

  def self.update_permissions(options)
  end

  def self.download_repos(options)
    if !File.exist?('/usr/local/bin/pip')
      system('sudo apt-get install curl python-pip python-dev ' +
                'build-essential ' +
             'sudo pip install --upgrade pip && ' +
             'sudo pip install --upgrade virtualenv ' +
             'sudo pip install --upgrade virtualenvwrapper ')
    end

    if !File.directory?('~/repos/pidcat')
      system('git clone https://github.com/JakeWharton/pidcat.git ~/repos/pidcat')
    end

    if !File.directory?('~/repos/solarize')
        system('git clone https://github.com/gmodarelli/solarize.git ~/repos/solarize')
        system('~/repos/solarize/soliarize.sh dark')
    end

  end

  def self.install_powerline(options)
  end

  def self.run(options)
    create_directories(options)
  end
end


options = OptParser.parse(ARGV)
DotfileInstaller.run(options)
