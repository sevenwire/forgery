class Forgery
  module Extensions
    class Array < ::Array

      def unextend
        to_a
      end

      def random
        Forgery::Extend(self[Kernel.rand(size)])
      end

      def random_subset(len=2)
        rs = []
        len.times { rs << random }
        Forgery::Extend(rs)
      end

    end
  end
end
