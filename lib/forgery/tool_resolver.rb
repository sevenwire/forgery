module Forgery
  class ToolResolver
    def initialize
      @tools_cache = {}
    end

    def find(key)
      @tools_cache[key] ||= constantize("Forgery::#{camelize(key.to_s)}")
    end

    def each
      @tools_cache.each {|key, value| yield key, value }
    end

    def camelize(string)
      string.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    end

    def constantize(string)
      names = string.split('::')
      names.shift if names.empty? || names.first.empty?

      resolve_constant(names)
    end
    
    def resolve_constant(names)
      constant = Object
      names.each do |name|
        constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
      end
      constant
    end
  end
end