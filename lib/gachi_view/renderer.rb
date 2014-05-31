# = Rendering Gachi erb
#
module GachiView

  class << self
    def template_base_path=(path_to_template)
      @template_base_path = path_to_template
    end

    def template_base_path
      @template_base_path
    end
  end

  module Renderer

    # = rendering assigns attribute by gachi record
    # [Usage]
    #   extend GachiView::Renderer or include GachiView::Renderer
    #
    #   render [template_path], assign_attribute
    def render(path, assign_attributes, options={})
      Binding.new(File.join(GachiView.template_base_path, path), assign_attributes).render
    end
  end
end
