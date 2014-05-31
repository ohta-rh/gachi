$:.unshift File.dirname(__FILE__) 
require 'lib/gachi_record'
require 'lib/gachi_view'

require 'app/models/user'

# configure
GachiView.template_base_path = File.join( Dir.pwd, 'app', 'views' )

# = TODO: Mock controller class
class GachiController

  include GachiView::Renderer

  def index
    @user = User.find 1

    render "users/index.html.erb"
  end

  # TODO: protected method
  def render(path)
    # processing parameters
    assign_attributes = {}.tap do |attr|
      self.instance_variables.each do |sym|
        attr.store sym.to_s.gsub(/@/,''), self.instance_variable_get(sym)
      end
    end
     
    print super path, assign_attributes
  end
end


controller = GachiController.new

controller.index
