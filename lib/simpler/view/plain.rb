module Simpler
  class View
    class PlainRender
      def initialize(template)
        @template = template
      end

      def result(binding)
        @template
      end
    end
  end
end