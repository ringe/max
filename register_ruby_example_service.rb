require "rubygems"
require "win32/service"
require "pp"

include Win32

options = {:service_name=>'ruby_example_service',
  :service_type => Service::WIN32_OWN_PROCESS,
  :description        => 'A custom service I wrote just for fun',
  :start_type         => Service::AUTO_START,
  :error_control      => Service::ERROR_NORMAL,
  :binary_path_name   => 'c:\Ruby\bin\ruby.exe -C c:\max ruby_example_service.rb',
  :load_order_group   => 'Network',
  :dependencies       => ['W32Time','Schedule'],
  :display_name       => 'ruby_example_service'}

pp options

# Create a new service
Service.create(options)
#Service.delete('ruby_example_service')
