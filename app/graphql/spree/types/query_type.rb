module Spree
  module Types
    class QueryType < ::GraphQL::Schema::Object
      graphql_name "Query"

      field :orders, [OrderType], 'Returns all orders', null: false, resolve: Resolvers::Order[:all] do
        argument :per_page, Integer, required: false
        argument :page, Integer, required: false
      end

      field :current_order, OrderType, 'Return current order', null: false, resolve: Resolvers::Order[:current]

      field :products, [ProductType], 'Returns all products', null: false, resolve: Resolvers::Product[:all] do
        argument :per_page, Integer, required: false
        argument :page, Integer, required: false
      end

      field :product, ProductType, 'Return a product detail by slug', { null: false, resolve: Resolvers::Product[:by_slug] } do
        argument :slug, String, required: true
      end

      field :order, Spree::Types::OrderType, 'Return a order detail by order number', { null: false, resolve: Resolvers::Order[:by_number] } do
        argument :number, String, required: true
      end

      # Spree storefront dashboard (customer account data)
      field :my_orders, Spree::Types::OrderType, 'Return all orders by current user', { null: false, resolve: Resolvers::Order[:account] }
    end
  end
end
