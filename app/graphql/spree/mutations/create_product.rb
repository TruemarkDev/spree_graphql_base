module Spree
  module Mutations
    class  CreateProduct < BaseMutation
      type ::Spree::Types::ProductType

      def action
        binding.pry
        ::Spree::Product.create
      end

      def default
        ::Spree::Product.none
      end

      def authorize_args
        [:create, ::Spree::Product]
      end
    end
  end
end
