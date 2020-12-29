module Spree
  class Types::PriceType < ::GraphQL::Schema::Object
    field :amount, String, null: false
    field :country_iso, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :currency, Currency, null: false
    field :display_amount, String, null: false
    field :display_country, String, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

    field :id, ID, null: false
    field :variant_id, Integer, null: false
    field :amount, Float, null: false
    field :compare_at_amount, Float, null: false
    field :currency, String, null: false # Currency type?
    field :deleted_at, ::GraphQL::Types::ISO8601DateTime, null: false
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
