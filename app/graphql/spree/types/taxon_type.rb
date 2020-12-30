module Spree
  class Types::TaxonType < ::GraphQL::Schema::Object

    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :parent_id, Integer, null: true
    field :position, Integer, null: true
    field :taxonomy_id, Integer, null: true
    field :lft, Integer, null: true
    field :rgt, Integer, null: true
    field :depth, Integer, null: true
    field :hide_from_nav, Boolean, null: true
    field :permalink, String, null: false
    field :meta_title, String, null: true
    field :meta_description, String, null: true
    field :meta_keywords, String, null: true
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
