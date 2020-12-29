module Spree
  class Types::ProductType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :price, ::Spree::Types::Money, null: true
    field :currency, String, null: false
    field :display_price, String, null: false
    field :available_on, String, null: false
    field :slug, String, null: false
    field :meta_title, String, null: true
    field :meta_description, String, null: true
    field :meta_keywords, String, null: true
    field :created_at, ::GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, ::GraphQL::Types::ISO8601DateTime, null: false
    field :discontinue_on, ::GraphQL::Types::ISO8601DateTime, null: true
    field :avg_rating, Float, null: true
    field :reviews_count, Integer, null: true
    field :vendor_id, Integer, null: true
    field :tax_category_id, Integer, null: true
    field :shipping_category_id, Integer, null: true
    field :promotionable, Boolean, null: false

    field :variants, [Types::VariantType], null: false

    # You can only see the details on a `Friendship`
    # if you're one of the people involved in it.
    def self.authorized?(object, context)
      # ability = Spree::Dependencies.ability_class.constantize.new(context[:spree_current_user])
      # super && ability.can?(:edit, object)
      super
    end
  end
end
