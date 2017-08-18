defmodule MangopayEx.Resource do
  @moduledoc false

  defmacro __using__(options) do
    import_functions  = options[:import] || []
    quote bind_quoted: [import_functions: import_functions] do
      alias MangopayEx.Api

      if :list in import_functions do
        @doc "List all #{@resource_name}s"
        def list do
          Api.list(__MODULE__)
        end
      end

      if :view in import_functions do
        @doc "View a single #{@resource_name}"
        def view(id) do
          Api.view(__MODULE__, id)
        end
      end

      if :auth in import_functions do
        def auth do
          Api.auth
        end
      end

      if :create in import_functions do
        @doc "Create a #{@resource_name}"
        def create(data) do
          Api.create(__MODULE__, data)
        end
      end

      if :update in import_functions do
        @doc "Update a #{@resource_name}"
        def update(id, data) do
          Api.update(__MODULE__, id, data)
        end
      end

      @doc false
      def endpoint, do: @endpoint
    end
  end
end
