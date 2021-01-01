module Spree
  module Mutations
    class CreateProduct < BaseMutation
      # type ::Spree::Types::ProductType
      null true

      argument :name, String, required: true
      argument :sku, String, required: false
      argument :price, Float, required: true
      argument :prototype_id, Int, required: true
      argument :shipping_category_id, Int, required: true
      argument :sku, String, required: false

      # TODO: This should move to multi vendor project
      argument :vendor_id, Int, required: false

      field :product, Types::ProductType, null: true
      field :errors, [String], null: false

      def shipping_category_id
        ShippingCategory.find_or_create_by(name: shipping_category).id
      end

      def resolve(**product_arguments)
        # authorize! :create, Product
        # binding.pry

        shipping_category_id = product_arguments[:shipping_category_id]

        product = ::Spree::Product.new(name: product_arguments[:name], sku: product_arguments[:sku], price: product_arguments[:price] )

        product.build_shipping_category(id: product_arguments[shipping_category_id])

        if product.save
          # Successful creation, return the created object with no errors
          {
            product: product,
            errors: [],
          }
        else
          # Failed save, return the errors to the client
          {
            product: nil,
            errors: product.errors.full_messages
          }
        end

      end

      def action(name:, **product_arguments) end

      def default
        ::Spree::Product.none
      end

      def authorize_args
        [:create, ::Spree::Product]
      end
    end
  end
end
