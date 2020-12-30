module Spree
  class Types::AddressType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :firstname, String, null: false
    field :lastname, String, null: false
    field :address1, String, null: false
    field :address2, String, null: false
    field :city, String, null: false
    field :zipcode, String, null: false
    field :phone, String, null: false
    field :state_name, String, null: false
    field :alternative_phone, String, null: false
    field :company, String, null: true
    field :state, Types::StateType, null: false
    field :country, Types::CountryType, null: false
    field :updated_at, ::GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
    field :deleted_at, ::GraphQL::Types::ISO8601DateTime, null: false

    # You can only see the details on a `Friendship`
    # if you're one of the people involved in it.
    def self.authorized?(object, context)
      # ability = Spree::Dependencies.ability_class.constantize.new(context[:spree_current_user])
      # super && ability.can?(:edit, object)
      super
    end
  end
end
