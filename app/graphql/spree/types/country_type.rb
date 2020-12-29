module Spree
  class Types::CountryType < ::GraphQL::Schema::Object
    field :id, ID, null: false
    field :iso_name, String, null: false
    field :iso, String, null: false
    field :iso3, String, null: false
    field :name, String, null: false
    field :numcode, Integer, null: false
    field :states_required, Boolean, null: false
    field :zipcode_required, Boolean, null: false
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
