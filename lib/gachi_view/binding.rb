module GachiView
  # = Binding ERB object
  class Binding

    # == Initialize template path and InstanceVariable
    #
    def initialize(path_to_template, assign_attributes)
      @path_to_template = path_to_template

      assign_attributes.each do |key, value|
        instance_variable_set("@#{key.to_s}", value)
      end

      @binding = binding
    end

    # == Execute file render
    def render
      ERB.new(File.read(@path_to_template)).result(@binding)
    end
  end
end
