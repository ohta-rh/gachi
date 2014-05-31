module GachiView
  ##
  # = when called methods but record not found, raised this execption. 
  class RecordNotFound < StandardError; end
end
$:.unshift File.dirname(__FILE__) 

require 'erb'
require 'yaml'
require 'gachi_record/result'
require 'gachi_record/dynamic_finder'
require 'gachi_record/base'
require 'gachi_record/connection'
require 'mysql2'
Mysql2::Client.default_query_options.merge!(symbolize_keys: true)
