defmodule AppsignalApiExampleWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use AppsignalApiExampleWeb, :controller
      use AppsignalApiExampleWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: AppsignalApiExampleWeb
      import Plug.Conn
      import AppsignalApiExampleWeb.Router.Helpers
      import AppsignalApiExampleWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/appsignal_api_example_web/templates",
                        namespace: AppsignalApiExampleWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      import AppsignalApiExampleWeb.Router.Helpers
      import AppsignalApiExampleWeb.ErrorHelpers
      import AppsignalApiExampleWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import AppsignalApiExampleWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
