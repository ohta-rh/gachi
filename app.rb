$:.unshift File.dirname(__FILE__) 
require 'lib/gachi_record'
require 'lib/gachi_view'

require 'app/models/user'

GachiView.template_path = Dir.pwd
p GachiView.template_path
