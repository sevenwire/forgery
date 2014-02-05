module Forgery
  module Extensions
    module ArrayExtensions
      def unextend
        to_a
      end

      # The only forgery extension that returns an extended object
      def random
        self[Kernel.rand(size)]
      end

      def random_subset(len=2)
        rs = []
        len.times { rs << random }
        rs
      end
    end

    class Array < ::Array
      include ArrayExtensions
    end
  end
end
