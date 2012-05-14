# This runs a simple sinatra app as a service

LOG_FILE = 'C:\\tunow_max.log'

require "rubygems"
require "sinatra/base"
require_relative "max"

begin
  require 'win32/daemon'
  include Win32
  $stdout.reopen("thin-server.log", "w")
  $stdout.sync = true
  $stderr.reopen($stdout)

  class Daemon
    def service_main

      #puts 'hi'
      File.open(LOG_FILE, "a"){ |f| f.puts "***Max service started #{Time.now}" }
      Max.run! :host => 'localhost', :port => 9090, :server => 'thin'
      #puts 'bye'
      while running?
        sleep 10
        File.open(LOG_FILE, "a"){ |f| f.puts "Max service is running #{Time.now}" }
      end
    end

    def service_stop
      File.open(LOG_FILE, "a"){ |f| f.puts "***Max service stopped #{Time.now}" }
      exit!
    end
  end

  Daemon.mainloop
rescue Exception => err
  File.open(LOG_FILE,'a+'){ |f| f.puts " ***Max service failure #{Time.now} err=#{err} " }
  raise
end
