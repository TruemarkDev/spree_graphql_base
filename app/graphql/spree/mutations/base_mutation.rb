module Spree
  module Mutations
    class BaseMutation < GraphQL::Schema::RelayClassicMutation
      null true

      argument_class Types::Base::Argument
      field_class Types::Base::Field
      input_object_class Types::Base::InputObject
      object_class Types::Base::Object


      def resolve
        return action if authorize?

        default
      end

      def authorize?
        spree_current_user = context[:spree_current_user]
        ability = Spree::Dependencies.ability_class.constantize.new(spree_current_user)
        ability.can?(*authorize_args)
      end

      # @return [Array<Object>]
      # @example [:read, ::Spree::Product]
      def authorize_args
        raise 'Define authorize arguments'
      end
    end
  end
end
