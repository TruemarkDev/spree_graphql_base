module Spree
  class Types::PrototypeType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :name, String, null: false
    field :properties, [Types::PropertyType], null: true
    field :option_types, [Types::OptionTypeType], null: true
    field :taxons, [Types::TaxonType], null: true
    field :created_at, ::GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, ::GraphQL::Types::ISO8601DateTime, null: false

    # You can only see the details on a `Friendship`
    # if you're one of the people involved in it.
    def self.authorized?(object, context)
      # ability = Spree::Dependencies.ability_class.constantize.new(context[:spree_current_user])
      # super && ability.can?(:edit, object)
      super
    end
  end
end
