$:.unshift File.dirname(__FILE__) 
require 'lib/gachi_record'
require 'lib/gachi_view'

require 'app/models/user'

GachiView.template_base_path = File.join( Dir.pwd, 'app', 'views' )

extend GachiView::Renderer


render "users/index.html.erb", {}
