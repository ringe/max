require 'rubygems'
require 'win32/service'

include Win32

SERVICE_NAME = 'max_api_service'

# Create a new service
Service.create({
  :service_name        => SERVICE_NAME,
  :service_type       => Service::WIN32_OWN_PROCESS,
  :description        => 'A service to enable remote Maxwell queries',
  :start_type         => Service::AUTO_START,
  :error_control      => Service::ERROR_NORMAL,
  :binary_path_name   => 'c:\Ruby192\bin\ruby.exe -C c:\Users\runari\Downloads\max service.rb',
  :load_order_group   => 'Network',
  :dependencies       => ['W32Time','Schedule'],
  :display_name       => SERVICE_NAME
})

# delete the service
# NOTE: if the services applet is up during this operation, the service won't be removed from that ui
# unitil you close and reopen it (it gets marked for deletion)
#Service.delete(SERVICE_NAME)
