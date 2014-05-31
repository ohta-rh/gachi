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
    #   extend GachiView::Renderer
    #
    #   render [template_path], assign_attribute
    def render(path, assign_attributes, options={})
      Binding.new(File.join(GachiView.template_base_path, path), assign_attributes).render
    end


    class Binding

      def initialize(path_to_template, assign_attributes)
        @path_to_template = path_to_template

        assign_attributes.each do 
          params.each do |key,val|
             instance_variable_set("@#{key}", val)
           end
        end

        @binding = binding
      end

      # == Execute file render
      def render
        ERB.new(File.read(@path_to_template)).result(@binding)
      end
    end
  end
end
