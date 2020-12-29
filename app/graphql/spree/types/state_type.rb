module Spree
  class Types::StateType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :name, String, null: false
    field :abbr, String, null: false
    field :country_id, Integer, null: false
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
