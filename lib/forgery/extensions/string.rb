class Forgery
  module Extensions
    class String < ::String

      def unextend
        to_s
      end

      def to_numbers(replace='#')
        gsub(/#{replace}/){ Kernel.rand(10) }
      end

      # Ripped right out of rails
      def camelize(first_letter = :upper)
        case first_letter
        when :upper
          to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
        when :lower
          first.downcase + camelize(self)[1..-1]
        end
      end

      if Module.method(:const_get).arity == 1
        def constantize
          names = self.split('::')
          names.shift if names.empty? || names.first.empty?

          constant = Object
          names.each do |name|
            constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
          end
          constant
        end
      else
        def constantize
          names = self.split('::')
          names.shift if names.empty? || names.first.empty?

          constant = Object
          names.each do |name|
            constant = constant.const_get(name, false) || constant.const_missing(name)
          end
          constant
        end
      end

    end
  end
end
