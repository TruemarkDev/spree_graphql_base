module Spree
  class Types::VariantType <  ::GraphQL::Schema::Object

    field :id, ID, null: true
    field :sku, String, null: true
    field :backorderable, Boolean, null: false
    field :currency, String, null: false
    field :depth, Integer, null: true
    field :height, Integer, null: true
    field :width, Integer, null: true
    field :display_price, String, null: false
    field :in_stock, Boolean, null: false
    field :is_master, Boolean, null: false
    field :options_text, String, null: false
    field :price, String, null: false
    field :purchasable, Boolean, null: false
    field :sku, String, null: false
    field :weight, String, null: false

    # You can only see the details on a `Friendship`
    # if you're one of the people involved in it.
    def self.authorized?(object, context)
      # ability = Spree::Dependencies.ability_class.constantize.new(context[:spree_current_user])
      # super && ability.can?(:edit, object)
      super
    end
  end
end
