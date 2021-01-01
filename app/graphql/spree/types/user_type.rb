module Spree
  class Types::UserType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :login, String, null: false
    field :email, String, null: false
    field :billing_address, Types::AddressType, null: false
    field :shipping_address, Types::AddressType, null: false
    field :addresses, [Types::AddressType], null: false
    field :order_count, Integer, null: true

    # You can only see the details on a `Friendship`
    # if you're one of the people involved in it.
    def self.authorized?(object, context)
      # ability = Spree::Dependencies.ability_class.constantize.new(context[:spree_current_user])
      # super && ability.can?(:edit, object)
      super
    end
  end
end
