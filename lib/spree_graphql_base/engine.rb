module SpreeGraphqlBase
  class Engine < Rails::Engine
    require 'spree/core'
    require 'spree/graphql' #TODO @prakash cleanup when graphql releases to core
    require 'graphql'
    require 'jwt'
    require 'graphiql/rails'

    isolate_namespace Spree
    engine_name 'spree_graphql_base'

    initializer 'spree_graphql_base.environment', before: :load_config_initializers do |_app|
      Spree::Graphql::Config = Spree::GraphqlConfiguration.new
      Spree::Graphql::Dependencies = Spree::GraphqlDependencies.new
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
