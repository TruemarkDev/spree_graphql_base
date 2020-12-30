module Spree
  module Types
    class MutationType < ::GraphQL::Schema::Object
      graphql_name "Mutation"

      field :cart, mutation: ::Spree::Mutations::Cart
      field :createProduct, mutation: ::Spree::Mutations::CreateProduct

      # field :add_item, [OrderType], null: false, mutation: Resolvers::Order[:add_item]

    end
  end
end
