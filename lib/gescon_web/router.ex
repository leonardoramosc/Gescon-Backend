defmodule GesconWeb.Router do
  use GesconWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :api_auth do
    plug Gescon.Auth.Pipeline
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :superuser do
    plug Gescon.Auth.Authorization, allowed_roles: [1]
  end

  scope "/api", GesconWeb do
    pipe_through :api

    post "/users/sign_in", UserController, :sign_in


    # resources "/condominios", CondominioController, except: [:new, :edit]
  end

  scope "/api/admin", GesconWeb.Admin, as: :admin do
    pipe_through [:api, :api_auth, :superuser]

    resources "/users", UserController, except: [:new, :edit]
    resources "/roles", RoleController, except: [:new, :edit]
    # resources "/condominios", CondominioController, except: [:new, :edit]

  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  #   import Phoenix.LiveDashboard.Router

  #   scope "/" do
  #     pipe_through [:fetch_session, :protect_from_forgery]
  #     live_dashboard "/dashboard", metrics: GesconWeb.Telemetry
  #   end
  # end
end
