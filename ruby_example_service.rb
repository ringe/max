LOG_FILE = 'C:\\test.log'

require 'sinatra'

class MyApp < Sinatra::Base

  get '/' do
    i = 0
    10000.times { i = i*i }
    'Hello world!'
  end

end

begin
  require 'win32/service'
  require 'win32/daemon'

  include Win32

  class DemoDaemon < Daemon

    def service_main
      MyApp.run! :host => 'localhost', :port => 9090, :server => 'thin'
      while running?
        sleep 10
        File.open("c:\\test.log", "a"){ |f| f.puts "Service is running #{Time.now}" } 
      end
    end 

    def service_stop
      File.open("c:\\test.log", "a"){ |f| f.puts "***Service stopped #{Time.now}" }
      exit! 
    end
  end

  DemoDaemon.mainloop
rescue Exception => err
  File.open(LOG_FILE,'a+'){ |f| f.puts " ***Daemon failure #{Time.now} err=#{err} " }
  raise
end
