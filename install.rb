#!/usr/bin/env ruby
require 'rubygems'
require 'win32/service'
require "pp"

include Win32

SERVICE_NAME = 'max_api_service'

# Create a new service
options = {
  :service_name        => SERVICE_NAME,
  :service_type       => Service::WIN32_OWN_PROCESS,
  :description        => 'A service to enable remote Maxwell queries',
  :start_type         => Service::AUTO_START,
  :error_control      => Service::ERROR_NORMAL,
  :binary_path_name   => 'c:\Ruby192\bin\ruby.exe -C c:\Ruby192\max ruby_example_service.rb',
  :load_order_group   => 'Network',
  :dependencies       => ['W32Time','Schedule'],
  :display_name       => SERVICE_NAME
}

pp options

Service.create(options)
