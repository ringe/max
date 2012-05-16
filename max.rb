#!/usr/bin/env ruby
require "sinatra/base"

class Max < Sinatra::Base
	get '/' do
    'Hello world!'
	end
end
