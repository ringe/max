require 'rubygems'
require 'win32/service'

include Win32

SERVICE_NAME = 'max_api_service'

# delete the service
# NOTE: if the services applet is up during this operation, the service won't be removed from that ui
# unitil you close and reopen it (it gets marked for deletion)
Service.delete(SERVICE_NAME)
