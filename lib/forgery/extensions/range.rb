class Forgery
  module Extensions
    class Range < ::Range

      def unextend
        ::Range.new(first, last, exclude_end?)
      end

      def random
        Integer(first) && Integer(last)
        raise ArgumentError if first > last
        Kernel.rand(last - first + (exclude_end? ? 0 : 1)) + first
      rescue ArgumentError
        Forgery::Extend(to_a).random
      end

    end
  end
end
