Spree::Core::Engine.add_routes do
  # Add your extension routes here
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  resource :graphql, only: :create, controller: :graphql
  resource :jwt, only: :create, controller: :jwt
end
