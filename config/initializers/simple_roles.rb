# config/initializers/simple_roles.rb
SimpleRoles.configure do
  valid_roles :designer, :admin, :sales, :sales_manager, :client
  strategy :one # Default is :one
end