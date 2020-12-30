module Spree
  class Types::StateChangeType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :name, String, null: false
    field :previous_state, String, null: false
    field :stateful_id, Integer, null: false #order
    field :stateful_type, String, null: false #order
    field :next_state, String, null: false #order
    field :user, Types::UserType, null: false

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
