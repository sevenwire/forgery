class String
  def to_numbers(replace='#')
    self.gsub(/#{replace}/){ Kernel.rand(10) }
  end

  if !defined?(RAILS_ROOT)
    def camelize(first_letter = :upper)
      case first_letter
      when :upper
        to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      when :lower
        first.downcase + camelize(self)[1..-1]
      end
    end

    def underscore
      to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
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