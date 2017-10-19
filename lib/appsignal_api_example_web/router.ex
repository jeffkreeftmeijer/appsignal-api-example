defmodule AppsignalApiExampleWeb.Router do
  use AppsignalApiExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AppsignalApiExampleWeb do
    pipe_through :api
  end
end
