class Forgery
  module Extensions
    class Range < ::Range

      def unextend
        ::Range.new(first, last, exclude_end?)
      end

      def random
        Integer(first) && Integer(last)
        raise ArgumentError if first > last
        Random.rand self
      rescue ArgumentError
        Forgery::Extend(to_a).random
      end

    end
  end
end
