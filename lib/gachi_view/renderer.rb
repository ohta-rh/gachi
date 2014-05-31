# = Rendering Gachi erb
#
module GachiView

  class << self
    def template_path=(path_to_template)
      @template_path = path_to_template
    end

    def template_path
      @template_path
    end
  end

  module Renderer

    # = rendering assigns attribute by gachi record
    # [Usage]
    #   extend GachiView::Renderer
    #
    #   render [template_path], assign_attribute
    class << self
      def render
        #TODO: called ERB
      end
    end
  end
end
